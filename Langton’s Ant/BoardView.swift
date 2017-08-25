//
//  BoardView.swift
//  Langton’s Ant
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import AppKit

final class BoardView: NSView {

	// MARK: - Properties

	var board: Board {
		didSet {
			if oldValue.size != board.size {
				invalidateIntrinsicContentSize()
			}
			
			setNeedsDisplay(bounds)
		}
	}

	var scale: CGFloat = 10 {
		didSet {
			invalidateIntrinsicContentSize()
		}
	}

	override var intrinsicContentSize: CGSize {
		return CGSize(width: CGFloat(board.size.width) * scale, height: CGFloat(board.size.height) * scale)
	}

	private let antColors: [NSColor] = [.red, .green, .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]


	// MARK: - Initializers

	init(board: Board) {
		self.board = board
		super.init(frame: .zero)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	// MARK: - UIView

	override func draw(_ rect: CGRect) {
		guard let context = NSGraphicsContext.current()?.cgContext else { return }

		// Background
		context.setFillColor(NSColor.white.cgColor)
		context.fill(bounds)

		// Noise
		context.setFillColor(NSColor.lightGray.cgColor)
		for point in board.noise {
			let rect = CGRect(x: scale * CGFloat(point.x), y: scale * CGFloat(point.y), width: scale, height: scale)
			context.fill(rect)
		}

		// Points
		context.setFillColor(NSColor.black.cgColor)
		for point in board.filled {
			let rect = CGRect(x: scale * CGFloat(point.x), y: scale * CGFloat(point.y), width: scale, height: scale)
			context.fill(rect)
		}

		// Ants
		for (i, ant) in board.ants.enumerated() {
			context.setFillColor(antColors[i].cgColor)
			context.fill(CGRect(x: scale * CGFloat(ant.position.x), y: scale * CGFloat(ant.position.y), width: scale, height: scale))
		}
	}
}
