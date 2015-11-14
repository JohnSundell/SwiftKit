import CoreGraphics

/// SwiftKit extensions to CGPoint
public extension CGPoint {
    /// Return the absolute distance between this point and another
    public func distanceToPoint(point: CGPoint) -> CGFloat {
        return sqrt(pow(abs(self.x - point.x), 2) + pow(abs(self.y - point.y), 2))
    }
    
    /// Return a new point by offsetting this point by a x and y value
    public func pointOffsetByX(x: CGFloat, y: CGFloat) -> CGPoint {
        var point = self
        point.x += x
        point.y += y
        
        return point
    }
}