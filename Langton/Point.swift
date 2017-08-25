//
//  Point.swift
//  Langton
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

public struct Point {

	// MARK: - Properties

	public let x: Int
	public let y: Int


	// MARK: - Initializers
	
	public init(x: Int, y: Int) {
		self.x = x
		self.y = y
	}
}

extension Point: Hashable {
	public var hashValue: Int {
		return x.hashValue ^ y.hashValue &* 16777619
	}

	public static func == (lhs: Point, rhs: Point) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}
}
