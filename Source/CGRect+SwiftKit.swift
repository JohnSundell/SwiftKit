import CoreGraphics

/// Swift extensions to CGRect
public extension CGRect {
    /// The rectangle stripped of any origin information, marking its bounds
    var bounds: CGRect {
        var bounds = self
        bounds.origin = CGPoint()
        return bounds
    }
}
