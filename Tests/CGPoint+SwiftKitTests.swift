import XCTest
import CoreGraphics
import SwiftKit

class CGPointSwiftKitTests: XCTestCase {
    func testXDistance() {
        let pointA = CGPoint(x: 7, y: 7)
        let pointB = CGPoint(x: 10, y: 7)
        
        XCTAssertTrue(pointA.distanceToPoint(pointB).dx == 3, "Incorrect X distance")
    }
    
    func testYDistance() {
        let pointA = CGPoint(x: 7, y: 7)
        let pointB = CGPoint(x: 7, y: 3)
        
        XCTAssertTrue(pointA.distanceToPoint(pointB).dy == -4, "Incorrect Y distance")
    }
    
    func testXandYDistance() {
        let pointA = CGPoint(x: 3, y: 3)
        let pointB = CGPoint(x: 6, y: 6)
        
        XCTAssertTrue(pointA.distanceToPoint(pointB).linearValue == sqrt(18), "Incorrect distance")
    }
    
    func testWithEqualPoints() {
        let pointA = CGPoint(x: 5, y: 5)
        let pointB = pointA
        
        XCTAssertTrue(pointA.distanceToPoint(pointB).linearValue == 0, "Distance was expected to be 0 for 2 equal points")
    }
    
    func testPointAtDistanceInDirection() {
        let origin = CGPoint(x: 7, y: 10)
        
        XCTAssertEqual(
            origin.pointAtDistance(5, inDirection: Direction.FourWay.Up, coordinateSystem: .OriginUpperLeft),
            CGPoint(x: 7, y: 5)
        )
        
        XCTAssertEqual(
            origin.pointAtDistance(-5, inDirection: Direction.FourWay.Up, coordinateSystem: .OriginUpperLeft),
            CGPoint(x: 7, y: 15)
        )
        
        XCTAssertEqual(
            origin.pointAtDistance(5, inDirection: Direction.FourWay.Right, coordinateSystem: .OriginUpperLeft),
            CGPoint(x: 12, y: 10)
        )
        
        XCTAssertEqual(
            origin.pointAtDistance(5, inDirection: Direction.FourWay.Down, coordinateSystem: .OriginUpperLeft),
            CGPoint(x: 7, y: 15)
        )
        
        XCTAssertEqual(
            origin.pointAtDistance(5, inDirection: Direction.FourWay.Left, coordinateSystem: .OriginUpperLeft),
            CGPoint(x: 2, y: 10)
        )
        
        XCTAssertEqual(
            origin.pointAtDistance(5, inDirection: Direction.FourWay.Up, coordinateSystem: .OriginLowerLeft),
            CGPoint(x: 7, y: 15)
        )
        
        XCTAssertEqual(
            origin.pointAtDistance(5, inDirection: Direction.EightWay.UpRight, coordinateSystem: .OriginUpperLeft),
            CGPoint(x: 11, y: 6)
        )
        
        XCTAssertEqual(
            origin.pointAtDistance(5, inDirection: Direction.EightWay.LeftUp, coordinateSystem: .OriginUpperLeft),
            CGPoint(x: 3, y: 6)
        )
    }
    
    func testClosestPointInGrid() {
        let tileSize = CGSize(width: 50, height: 70)
        
        XCTAssertEqual(CGPoint(x: 10, y: 10).closestPointInGridWithTileSize(tileSize), CGPoint(x: 0, y: 0))
        XCTAssertEqual(CGPoint(x: 30, y: 10).closestPointInGridWithTileSize(tileSize), CGPoint(x: 50, y: 0))
        XCTAssertEqual(CGPoint(x: 100, y: 140).closestPointInGridWithTileSize(tileSize), CGPoint(x: 100, y: 140))
    }
}
