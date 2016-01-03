import CoreGraphics

/// SwiftKit extensions to CGSize
public extension CGSize {
    /// Convenience initializer to create a square size
    public init(squareSize: CGFloat) {
        self.init(width: squareSize, height: squareSize)
    }
    
    /// Return a new size that's the product of scaling this size in both dimensions
    public func sizeWithScale(scale: CGFloat) -> CGSize {
        var size = self
        size.width *= scale
        size.height *= scale
        
        return size
    }
    
    /// Return the point at which this size is centered within another size
    public func centerPointInSize(size: CGSize) -> CGPoint {
        return CGPoint(
            x: floor((size.width - self.width) / 2),
            y: floor((size.height - self.height) / 2)
        )
    }
    
    /// Conver this size structure into a point structure, with x = width, y = height
    public func toCGPoint() -> CGPoint {
        return CGPoint(x: self.width, y: self.height)
    }
}
