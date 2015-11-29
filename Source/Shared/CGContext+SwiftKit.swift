import CoreGraphics

/// SwiftKit extensions to CoreGraphics' CGContext
public extension CGContext {
    /// Create a bitmap context with a certain size, with sensible defaults
    static func bitmapContextWithSize(size: CGSize) -> CGContextRef? {
        return CGBitmapContextCreate(nil, Int(size.width), Int(size.height), 8, 0, CGColorSpaceCreateDeviceRGB(), CGImageAlphaInfo.PremultipliedLast.rawValue)
    }
}
