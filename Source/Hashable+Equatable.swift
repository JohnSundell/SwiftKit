import Foundation

/// Default equality operator for Hashable types
public func ==<T: Hashable>(lhs: T, rhs: T) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
