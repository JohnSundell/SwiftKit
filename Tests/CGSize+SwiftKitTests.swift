import XCTest
import CoreGraphics

class CGSizeSwiftKitTests: XCTestCase {
    func testScalingWithPositiveScale() {
        let scaledSize = CGSize(width: 10, height: 5).sizeWithScale(2)
        XCTAssertTrue(CGSize(width: 20, height: 10) == scaledSize)
    }
    
    func testScalingWithNegativeScale() {
        let scaledSize = CGSize(width: 10, height: 5).sizeWithScale(-3)
        XCTAssertTrue(CGSize(width: -30, height: -15) == scaledSize)
    }
    
    func testCenterPointInLargerSize() {
        let size = CGSize(width: 10, height: 20)
        let largerSize = CGSize(width: 50, height: 100)
        
        XCTAssertTrue(CGPoint(x: 20, y: 40) == size.centerPointInSize(largerSize))
    }
    
    func testCenterPointInSmallerSize() {
        let size = CGSize(width: 10, height: 20)
        let smallerSize = CGSize(width: 6, height: 2)
        
        XCTAssertTrue(CGPoint(x: -2, y: -9) == size.centerPointInSize(smallerSize))
    }
}
