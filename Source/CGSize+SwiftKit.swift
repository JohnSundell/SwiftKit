import CoreGraphics

/// SwiftKit extensions to CGSize
public extension CGSize {
    /// Return a new size that's the product of scaling this size in both dimensions
    public func sizeWithScale(scale: CGFloat) -> CGSize {
        var size = self
        size.width *= scale
        size.height *= scale
        
        return size
    }
}
