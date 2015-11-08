import XCTest

class NumberTests: XCTestCase {
    func testFractionalValue() {
        XCTAssertEqual(Double(7.5).fractionalValue, 0.5)
        XCTAssertEqual(Double(7).fractionalValue, 0)
    }
    
    func testToString() {
        XCTAssertEqual(7.toString(), "7")
        XCTAssertEqual(Int(-7).toString(), "-7")
        XCTAssertEqual(UInt(7).toString(), "7")
        XCTAssertEqual(UInt32(7).toString(), "7")
        XCTAssertEqual(Double(7).toString(), "7.0")
        XCTAssertEqual(Double(7.7).toString(), "7.7")
        XCTAssertEqual(CGFloat(7).toString(), "7.0")
        XCTAssertEqual(CGFloat(7.7).toString(), "7.7")
    }
    
    func testFloor() {
        XCTAssertEqual(Double(7.5).floor(), 7)
        XCTAssertEqual(Double(7).floor(), 7)
    }
}
