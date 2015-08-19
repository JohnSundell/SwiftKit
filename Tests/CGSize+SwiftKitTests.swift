import XCTest
import CoreGraphics

class CGSizeSwiftKitTests: XCTestCase {
    func testWithPositiveScale() {
        var size = CGSize(width: 10, height: 10)
        var scaledSize = size.sizeWithScale(2)
        
        XCTAssertTrue(CGSize(width: 20, height: 20) == scaledSize)
    }
    
    func testWithNegativeScale() {
        var size = CGSize(width: 10, height: 10)
        var scaledSize = size.sizeWithScale(-3)
        
        XCTAssertTrue(CGSize(width: -30, height: -30) == scaledSize)
    }
}
