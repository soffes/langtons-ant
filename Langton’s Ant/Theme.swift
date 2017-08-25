//
//  Theme.swift
//  Langton’s Ant
//
//  Created by Sam Soffes on 8/25/17.
//  Copyright © 2017 Sam Soffes. All rights reserved.
//

import AppKit

protocol Theme {
	var backgroundColor: NSColor { get }
	var filledColor: NSColor { get }
	var noiseColor: NSColor { get }
	var antColors: [NSColor] { get }
}


extension Theme {
	var antColors: [NSColor] {
		return [.red, .green, .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]
	}
}


struct LightTheme: Theme {
	var backgroundColor: NSColor {
		return .white
	}

	var filledColor: NSColor {
		return .black
	}

	var noiseColor: NSColor {
		return NSColor(white: 0.8, alpha: 1)
	}
}


struct DarkTheme: Theme {
	var backgroundColor: NSColor {
		return .black
	}

	var filledColor: NSColor {
		return .white
	}

	var noiseColor: NSColor {
		return NSColor(white: 0.2, alpha: 1)
	}
}
