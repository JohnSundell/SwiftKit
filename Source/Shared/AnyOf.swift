import Foundation

/// A structure that represents any value `T` in a Set or Array literal, useful in 1:many comparisons
public struct AnyOf<T: Hashable> {
    private let values: Set<T>
    
    /// Initialize an instance of AnyOf<T> with an Array literal
    public init(_ values: T...) {
        var valueSet = Set<T>()
        
        for value in values {
            valueSet.insert(value)
        }
        
        self.init(values: valueSet)
    }
    
    /// Initialize an instance of AnyOf<T> with a Set
    public init(values: Set<T>) {
        self.values = values
    }
}

// MARK: - Operators

/// Compare a value of T with an AnyOf<T> instance
public func ==<T>(lhs: T, rhs: AnyOf<T>) -> Bool {
    return rhs.values.contains(lhs)
}

/// Compare an AnyOf<T> instance with a value of T
public func ==<T>(lhs: AnyOf<T>, rhs: T) -> Bool {
    return lhs.values.contains(rhs)
}

/// Inverse compare a value of T with an AnyOf<T> instance
public func !=<T>(lhs: T, rhs: AnyOf<T>) -> Bool {
    return !(lhs == rhs)
}

/// Inverse compare an AnyOf<T> instance with a value of T
public func !=<T>(lhs: AnyOf<T>, rhs: T) -> Bool {
    return !(lhs == rhs)
}

/// Return whether any of T is greater than T if T is a numeric type
public func ><T: Number>(lhs: AnyOf<T>, rhs: T) -> Bool {
    for value in lhs.values {
        if value.toDouble() > rhs.toDouble() {
            return true
        }
    }
    
    return false
}
