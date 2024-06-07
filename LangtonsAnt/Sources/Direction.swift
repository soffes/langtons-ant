public enum Direction {

	// MARK: - Cases
	
	case north
	case east
	case south
	case west

	// MARK: - Properties

	public var turningRight: Direction {
		switch self {
		case .north: return .east
		case .east: return .south
		case .south: return .west
		case .west: return .north
		}
	}

	public var turningLeft: Direction {
		switch self {
		case .north: return .west
		case .east: return .north
		case .south: return .east
		case .west: return .south
		}
	}
}
