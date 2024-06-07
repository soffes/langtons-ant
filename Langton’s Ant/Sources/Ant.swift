public struct Ant {

	// MARK: - Properties

	public let name: String
	public var position: Point
	public var heading: Direction

	// MARK: - Turning

	public mutating func turnLeft() {
		heading = heading.turningLeft
	}

	public mutating func turnRight() {
		heading = heading.turningRight
	}

	// MARK: - Moving

	public mutating func moveForward() {
		switch heading {
		case .north:
			position = Point(x: position.x, y: position.y - 1)
		case .east:
			position = Point(x: position.x + 1, y: position.y)
		case .south:
			position = Point(x: position.x, y: position.y + 1)
		case .west:
			position = Point(x: position.x - 1, y: position.y)
		}
	}
}
