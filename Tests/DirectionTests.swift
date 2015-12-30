import XCTest

class DirectionTests: XCTestCase {
    func testCount() {
        XCTAssertEqual(Direction.FourWay.count, 4)
        XCTAssertEqual(Direction.EightWay.count, 8)
    }
    
    func testRadianValue() {
        XCTAssertEqual(Direction.FourWay.Up.radianValue, 0)
        XCTAssertEqual(Direction.FourWay.Right.radianValue, CGFloat(M_PI_2))
        XCTAssertEqual(Direction.FourWay.Down.radianValue, CGFloat(M_PI))
        XCTAssertEqual(Direction.FourWay.Left.radianValue, CGFloat(M_PI + M_PI_2))
        
        XCTAssertEqual(Direction.EightWay.Up.radianValue, 0)
        XCTAssertEqual(Direction.EightWay.UpRight.radianValue, CGFloat(M_PI_4))
        XCTAssertEqual(Direction.EightWay.Right.radianValue, CGFloat(M_PI_2))
        XCTAssertEqual(Direction.EightWay.RightDown.radianValue, CGFloat(M_PI_2 + M_PI_4))
        XCTAssertEqual(Direction.EightWay.Down.radianValue, CGFloat(M_PI))
        XCTAssertEqual(Direction.EightWay.DownLeft.radianValue, CGFloat(M_PI + M_PI_4))
        XCTAssertEqual(Direction.EightWay.Left.radianValue, CGFloat(M_PI + M_PI_2))
        XCTAssertEqual(Direction.EightWay.LeftUp.radianValue, CGFloat(M_PI + M_PI_2 + M_PI_4))
    }
    
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
