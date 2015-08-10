import Foundation

/// Compare a value of T with an AnyOf<T> instance
public func ==<T>(lhs: T, rhs: AnyOf<T>) -> Bool {
    return rhs.values.contains(lhs)
}

/// Compare an AnyOf<T> instance with a value of T
public func ==<T>(lhs: AnyOf<T>, rhs: T) -> Bool {
    return lhs.values.contains(rhs)
}

/// A structure that represents any value `T` in a Set or Array literal, useful in 1:many comparisons
public struct AnyOf<T: Hashable> {
    private let values: Set<T>
    
    public init(_ values: T...) {
        var valueSet = Set<T>()
        
        for value in values {
            valueSet.insert(value)
        }
        
        self.init(values: valueSet)
    }
    
    public init(values: Set<T>) {
        self.values = values
    }
}
