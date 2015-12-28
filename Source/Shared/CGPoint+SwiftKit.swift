import CoreGraphics

/// SwiftKit extensions to CGPoint
public extension CGPoint {
    /// Return the distance (in form of a vector) between this point and another
    public func distanceToPoint(point: CGPoint) -> CGVector {
        return CGVector(dx: point.x - self.x, dy: point.y - self.y)
    }
    
    /// Return a new point by offsetting this point by a x and y value
    public func pointOffsetByX(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
    
    /// Return a new point by multiplying this point's x and y values by a factor
    public func pointMultipliedByX(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x * x, y: self.y * y)
    }
}