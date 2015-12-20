import XCTest

class DirectionTests: XCTestCase {
    func testOppositeDirection() {
        XCTAssertEqual(Direction.FourWay.Left.oppositeDirection(), Direction.FourWay.Right)
        XCTAssertEqual(Direction.FourWay.Up.oppositeDirection(), Direction.FourWay.Down)
        XCTAssertEqual(Direction.EightWay.Left.oppositeDirection(), Direction.EightWay.Right)
        XCTAssertEqual(Direction.EightWay.RightDown.oppositeDirection(), Direction.EightWay.LeftUp)
    }
}
