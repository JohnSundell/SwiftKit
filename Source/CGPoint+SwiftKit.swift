import CoreGraphics

/// SwiftKit extensions to CGPoint
public extension CGPoint {
    /// Return the absolute distance between this point and another
    public func distanceToPoint(point: CGPoint) -> CGFloat {
        return sqrt(pow(abs(self.x - point.x), 2) + pow(abs(self.y - point.y), 2))
    }
}