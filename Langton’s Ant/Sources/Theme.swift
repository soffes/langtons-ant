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
		.white
	}

	var filledColor: NSColor {
		.black
	}

	var noiseColor: NSColor {
		NSColor(white: 0.8, alpha: 1)
	}
}

struct DarkTheme: Theme {
	var backgroundColor: NSColor {
		.black
	}

	var filledColor: NSColor {
		.white
	}

	var noiseColor: NSColor {
		NSColor(white: 0.2, alpha: 1)
	}
}
