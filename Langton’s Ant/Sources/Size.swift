//
//  Size.swift
//  Langton
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

public struct Size {

	// MARK: - Properties

	public let width: Int
	public let height: Int


	// MARK: - Initializers

	public init(width: Int, height: Int) {
		self.width = width
		self.height = height
	}
}

extension Size: Equatable {
	public static func == (lhs: Size, rhs: Size) -> Bool {
		return lhs.width == rhs.width && lhs.height == rhs.height
	}
}
