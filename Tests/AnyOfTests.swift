import XCTest

class AnyOfTests: XCTestCase {
    func testEquality() {
        let valueA = "A"
        let valueB = "B"
        let anyValue = AnyOf(valueA, valueB)
        
        XCTAssertTrue(valueA == anyValue)
        XCTAssertTrue(valueB == anyValue)
        XCTAssertTrue(anyValue == valueA)
        XCTAssertTrue(anyValue == valueB)
        
        let valueC = "C"
        
        XCTAssertFalse(valueC == anyValue)
        XCTAssertFalse(anyValue == valueC)
    }
}
