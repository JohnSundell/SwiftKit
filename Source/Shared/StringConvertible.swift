import Foundation

/// Protocol that types that can be convertible to strings conform to
public protocol StringConvertible {
    /// Return a string representation of the object
    func toString() -> String
}
