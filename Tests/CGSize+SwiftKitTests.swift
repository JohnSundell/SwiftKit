import XCTest
import CoreGraphics

class CGSizeSwiftKitTests: XCTestCase {
    func testScalingWithPositiveScale() {
        var size = CGSize(width: 10, height: 5)
        var scaledSize = size.sizeWithScale(2)
        
        XCTAssertTrue(CGSize(width: 20, height: 10) == scaledSize)
    }
    
    func testScalingWithNegativeScale() {
        var size = CGSize(width: 10, height: 5)
        var scaledSize = size.sizeWithScale(-3)
        
        XCTAssertTrue(CGSize(width: -30, height: -15) == scaledSize)
    }
    
    func testCenterPointInLargerSize() {
        var size = CGSize(width: 10, height: 20)
        var largerSize = CGSize(width: 50, height: 100)
        
        XCTAssertTrue(CGPoint(x: 20, y: 40) == size.centerPointInSize(largerSize))
    }
    
    func testCenterPointInSmallerSize() {
        var size = CGSize(width: 10, height: 20)
        var smallerSize = CGSize(width: 6, height: 2)
        
        XCTAssertTrue(CGPoint(x: -2, y: -9) == size.centerPointInSize(smallerSize))
    }
}
