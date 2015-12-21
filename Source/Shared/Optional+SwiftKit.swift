import Foundation

/// SwiftKit extensions to Swift's Optional type
public extension Optional {
    /// Unwrap this optional's value, or throw an NSError. See `Require()` for more info.
    public func require() throws -> Wrapped {
        return try Require(self)
    }
}
