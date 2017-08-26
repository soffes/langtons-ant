//
//  Speed.swift
//  Langton’s Ant
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import Foundation

enum Speed: Int {
	case crawl
	case slow
	case normal
	case fast
	case insane

	var animationTimeInterval: TimeInterval {
		switch self {
		case .crawl:
			return 1 / 12
		case .slow:
			return 1 / 30
		default:
			return 1 / 60
		}
	}

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
