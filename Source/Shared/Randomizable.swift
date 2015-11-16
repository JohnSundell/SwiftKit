import Foundation

/// Protocol for types that are randomizable
public protocol Randomizable {
    /// Create a new random value based on this value
    func randomize() -> Self
}

/// Extension that makes UInt conform to Randomizable
extension UInt: Randomizable {
    public func randomize() -> UInt {
        return UInt(random()) % self
    }
}
