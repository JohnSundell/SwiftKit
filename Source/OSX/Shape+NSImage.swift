import Cocoa

/// OS X-specific extensions to Shape
public extension Shape {
    /// Generate an NSImage representation of the shape, using the size of the shape itself
    public func toImage() -> NSImage? {
        return self.toImageWithSize(self.size)
    }
    
    /// Generate an NSImage representation of the shape with a certain size. The shape will be scaled to fit the size.
    public func toImageWithSize(size: CGSize) -> NSImage? {
        guard let imageRef = self.toCGImageWithSize(size) else {
            return nil
        }
        
        return NSImage(CGImage: imageRef, size: size)
    }
}
