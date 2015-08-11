import Foundation

/// Protocol for objects that may be expressed as a numeric value
public protocol Quantifiable {
    /// Return the double value that may represent the object
    func toDouble() -> Double
}
