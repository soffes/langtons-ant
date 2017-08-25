//
//  LangtonsAntView.swift
//  Langton’s Ant
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import ScreenSaver

final class LangtonsAntView: ScreenSaverView {

	// MARK: - Properties

	private var boardView: BoardView? {
		willSet {
			boardView?.removeFromSuperview()
		}
	}

	private var previousSize: CGSize = .zero


	// MARK: - NSView

	override func viewDidMoveToWindow() {
		super.viewDidMoveToWindow()
		setupBoard()
	}

	override func resizeSubviews(withOldSize oldSize: NSSize) {
		super.resizeSubviews(withOldSize: oldSize)
		setupBoard()
	}

	override func draw(_ rect: NSRect) {
		guard let context = NSGraphicsContext.current()?.cgContext else { return }

		context.setFillColor(NSColor.white.cgColor)
		context.fill(bounds)
	}


	// MARK: - ScreenSaverView

	override func animateOneFrame() {
		boardView?.board.tick()
	}

	override var animationTimeInterval: TimeInterval {
		get {
			return 1 / 60
		}

		set {}
	}


	// MARK: - Private

	private func setupBoard() {
		if previousSize == bounds.size {
			return
		}

		previousSize = bounds.size

		var board = Board(size: Size(width: Int(previousSize.width / 10), height: Int(previousSize.height / 10)))

		// Create 9 ants
		let offset = Point(x: Int(Double(board.size.width) * 0.2), y: Int(Double(board.size.height) * 0.2))
		let maxX = UInt32(Double(board.size.width) * 0.6)
		let maxY = UInt32(Double(board.size.width) * 0.6)
		for i in 1...9 {
			let x = Int(arc4random_uniform(maxX)) + offset.x
			let y = Int(arc4random_uniform(maxY)) + offset.y
			board.addAnt(named: "Ant \(i)", at: Point(x: x, y: y))
		}

		// Create some noise
		var noise = Set<Point>()
		for x in 0..<board.size.width {
			for y in 0..<board.size.height {
				if arc4random_uniform(10) == 0 {
					let point = Point(x: x, y: y)
					noise.insert(point)
				}
			}
		}

		board.noise = noise

		let boardView = BoardView(board: board, theme: DarkTheme())

		// Add the board as a subview
		boardView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(boardView)

		// Center it
		NSLayoutConstraint.activate([
			boardView.centerXAnchor.constraint(equalTo: centerXAnchor),
			boardView.centerYAnchor.constraint(equalTo: centerYAnchor)
		])

		self.boardView = boardView
	}
}
