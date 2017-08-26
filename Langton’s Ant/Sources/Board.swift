//
//  Board.swift
//  Langton
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

public struct Board {

	// MARK: - Properties

	public let size: Size

	public private(set) var ants = [Ant]()

	public private(set) var filled = Set<Point>()

	public var noise = Set<Point>()


	// MARK: - Initializers

	public init(size: Size) {
		self.size = size
	}


	// MARK: - Subscript

	public subscript(_ point: Point) -> Bool {
		get {
			return filled.contains(point) || noise.contains(point)
		}

		set(newValue) {
			if newValue {
				filled.insert(point)
			} else {
				filled.remove(point)
			}

			noise.remove(point)
		}
	}


	// MARK: - Adding & Removing Ants

	public mutating func addAnt(named name: String, at point: Point, heading: Direction = .south) {
		add(Ant(name: name, position: point, heading: heading))
	}

	public mutating func add(_ ant: Ant) {
		ants.append(ant)
	}

	public mutating func removeAnt(named name: String) {
		if let index = ants.index(where: { $0.name == name }) {
			ants.remove(at: index)
		}
	}


	// MARK: - Advancing Time
	
	public mutating func tick() {
		for (i, ant) in ants.enumerated() {
			var updated = ant
			let isFilled = self[ant.position]

			// At a filled square, turn 90° left
			if isFilled {
				updated.turnLeft()
			}

			// At a unfilled square, turn 90° right
			else {
				updated.turnRight()
			}

			// Flip the color of the square
			self[ant.position] = !isFilled

			// Move forward one unit
			updated.moveForward()

			ants[i] = updated
		}
	}
}

