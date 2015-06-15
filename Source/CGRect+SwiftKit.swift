import CoreGraphics

public extension CGRect {
    var bounds: CGRect {
        var bounds = self
        bounds.origin = CGPoint()
        return bounds
    }
}
