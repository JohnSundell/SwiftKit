import Foundation

/// Structure containing a pair of the same type
public struct Pair<T> {
    /// The first value
    public var first: T
    /// The second value
    public var second: T
    
    /// Create an instance with two values
    public init(first: T, second: T) {
        self.first = first
        self.second = second
    }
}
