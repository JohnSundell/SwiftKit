import XCTest

class PositionTests: XCTestCase {
    func testUnboxableKeySupportFor2DPosition() {
        XCTAssertEqual(Position_2D.transformUnboxedKey("3:5"), Position_2D(x: 3, y: 5))
        XCTAssertEqual(Position_2D.transformUnboxedKey("07:09"), Position_2D(x: 7, y: 9))
        XCTAssertEqual(Position_2D.transformUnboxedKey("3.14:9.21"), Position_2D(x: 3.14, y: 9.21))
        XCTAssertNil(Position_2D<Int>.transformUnboxedKey(""))
        XCTAssertNil(Position_2D<Int>.transformUnboxedKey(":"))
        XCTAssertNil(Position_2D<Int>.transformUnboxedKey("3:5:9"))
    }
    
    func testUnboxableKeySupportFor3DPosition() {
        XCTAssertEqual(Position_3D.transformUnboxedKey("3:5:7"), Position_3D(x: 3, y: 5, z: 7))
        XCTAssertEqual(Position_3D.transformUnboxedKey("07:09:10"), Position_3D(x: 7, y: 9, z: 10))
        XCTAssertEqual(Position_3D.transformUnboxedKey("3.14:9.21:-0.19"), Position_3D(x: 3.14, y: 9.21, z: -0.19))
        XCTAssertNil(Position_3D<Int>.transformUnboxedKey(""))
        XCTAssertNil(Position_3D<Int>.transformUnboxedKey(":"))
        XCTAssertNil(Position_3D<Int>.transformUnboxedKey("3:5"))
        XCTAssertNil(Position_3D<Int>.transformUnboxedKey("3:5:9:21"))
    }
}