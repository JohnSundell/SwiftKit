import CoreGraphics

/// Swift extensions to CGRect
public extension CGRect {
    /// The rectangle stripped of any origin information, marking its bounds
    var bounds: CGRect {
        var bounds = self
        bounds.origin = CGPoint()
        return bounds
    }
    
    /// Convenience initializer to create a CGRect with only a CGPoint
    init(origin: CGPoint) {
        self.origin = origin
        self.size = CGSize()
    }
    
    /// Convenience initializer to create a CGRect with only a CGSize
    init(size: CGSize) {
        self.origin = CGPoint()
        self.size = size
    }
}
