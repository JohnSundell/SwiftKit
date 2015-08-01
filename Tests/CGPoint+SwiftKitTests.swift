import XCTest
import CoreGraphics

class CGPointSwiftKitTests: XCTestCase {
    func testXDistance() {
        let pointA = CGPoint(x: 7, y: 7)
        let pointB = CGPoint(x: 10, y: 7)
        
        XCTAssertTrue(pointA.distanceToPoint(pointB) == 3, "Incorrect X distance")
    }
    
    func testYDistance() {
        let pointA = CGPoint(x: 7, y: 7)
        let pointB = CGPoint(x: 7, y: 3)
        
        XCTAssertTrue(pointA.distanceToPoint(pointB) == 4, "Incorrect Y distance")
    }
    
    func testXandYDistance() {
        let pointA = CGPoint(x: 3, y: 3)
        let pointB = CGPoint(x: 6, y: 6)
        
        XCTAssertTrue(pointA.distanceToPoint(pointB) == sqrt(18), "Incorrect distance")
    }
    
    func testWithEqualPoints() {
        let pointA = CGPoint(x: 5, y: 5)
        let pointB = pointA
        
        XCTAssertTrue(pointA.distanceToPoint(pointB) == 0, "Distance was expected to be 0 for 2 equal points")
    }
}
