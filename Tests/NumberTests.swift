import XCTest

class NumberTests: XCTestCase {
    func testToString() {
        let int = Int(7)
        XCTAssertEqual(int.toString(), "7")
        
        let negativeInt = Int(-7)
        XCTAssertEqual(negativeInt.toString(), "-7")
        
        let uint = UInt(7)
        XCTAssertEqual(uint.toString(), "7")
        
        let uint32 = UInt32(7)
        XCTAssertEqual(uint32.toString(), "7")
        
        let evenDouble = Double(7)
        XCTAssertEqual(evenDouble.toString(), "7.0")
        
        let double = Double(7.7)
        XCTAssertEqual(double.toString(), "7.7")
        
        let evenCGFloat = CGFloat(7)
        XCTAssertEqual(evenCGFloat.toString(), "7.0")
        
        let cgFloat = CGFloat(7.7)
        XCTAssertEqual(cgFloat.toString(), "7.7")
    }
}
