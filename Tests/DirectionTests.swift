import XCTest

class DirectionTests: XCTestCase {
    func testOppositeDirection() {
        XCTAssertEqual(Direction.FourWay.Left.oppositeDirection(), Direction.FourWay.Right)
        XCTAssertEqual(Direction.FourWay.Up.oppositeDirection(), Direction.FourWay.Down)
        XCTAssertEqual(Direction.EightWay.Left.oppositeDirection(), Direction.EightWay.Right)
        XCTAssertEqual(Direction.EightWay.RightDown.oppositeDirection(), Direction.EightWay.LeftUp)
    }
    
    func testUnboxSupport() {
        struct Model: Unboxable {
            let fourWayDirection: Direction.FourWay
            let eightWayDirection: Direction.EightWay
            
            init(unboxer: Unboxer) {
                self.fourWayDirection = unboxer.unbox("4way")
                self.eightWayDirection = unboxer.unbox("8way")
            }
        }
        
        do {
            let model: Model = try UnboxOrThrow([
                "4way" : "Right",
                "8way" : "DownLeft"
            ])
            
            XCTAssertEqual(model.fourWayDirection, Direction.FourWay.Right)
            XCTAssertEqual(model.eightWayDirection, Direction.EightWay.DownLeft)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
