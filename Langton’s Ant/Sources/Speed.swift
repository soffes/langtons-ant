//
//  Speed.swift
//  Langton’s Ant
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import Foundation

enum Speed: Int {
	case normal = 2
	case fast
	case insane

	var ticksPerFrame: UInt {
		switch self {
		case .fast:
			return 2
		case .insane:
			return 10
		default:
			return 1
		}
	}
}
