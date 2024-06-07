enum Speed: Int {
	case slow = 1
	case normal
	case fast
	case insane

	var framesPerSecond: UInt {
		switch self {
		case .slow:
			return 2
		case .normal:
			return 15
		case .fast:
			return 30
		case .insane:
			return 60
		}
	}

	var ticksPerFrame: UInt {
		switch self {
		case .slow:
			return 1
		case .normal:
			return 1
		case .fast:
			return 1
		case .insane:
			return 10
		}
	}
}
