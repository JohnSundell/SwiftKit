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
    
    /// Create a new rect by changing this rect's origin property
    func rectWithOrigin(origin: CGPoint) -> CGRect {
        var rect = self
        rect.origin = origin
        return rect
    }
    
    /// Create a new rect by changing this rect's size property
    func rectWithSize(size: CGSize) -> CGRect {
        var rect = self
        rect.size = size
        return rect
    }
    
    /// Create a new rect by changing this rect's width
    func rectWithWidth(width: CGFloat) -> CGRect {
        var rect = self
        rect.size.width = width
        return rect
    }
    
    /// Create a new rect by changing this rect's height
    func rectWithHeight(height: CGFloat) -> CGRect {
        var rect = self
        rect.size.height = height
        return rect
    }
    
    /// Create a new rect by resizing this rect
    func resizedRectByX(widthChange: CGFloat, y heightChange: CGFloat) -> CGRect {
        var rect = self
        rect.size.width += widthChange
        rect.size.height += heightChange
        return rect
    }
}
