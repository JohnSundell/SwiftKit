import XCTest

class NumberTests: XCTestCase {
    func testFractionalValue() {
        XCTAssertEqual(Double(7.5).fractionalValue, 0.5)
        XCTAssertEqual(Double(7).fractionalValue, 0)
    }
    
    func testRoundedValueWithDecimalCount() {
        XCTAssertEqual(1.12021.roundedValueWithDecimalCount(2), 1.12)
        XCTAssertEqual(1.12021.roundedValueWithDecimalCount(5), 1.12021)
        XCTAssertEqual(1.12021.roundedValueWithDecimalCount(7), 1.12021)
    }
    
    func testIsEvenlyDivisible() {
        XCTAssertTrue(0.isEvenlyDivisibleBy(2))
        XCTAssertTrue(4.isEvenlyDivisibleBy(2))
        XCTAssertFalse(4.4.isEvenlyDivisibleBy(2))
        XCTAssertFalse(3.isEvenlyDivisibleBy(2))
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
