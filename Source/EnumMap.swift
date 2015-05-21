import Foundation

/// A collection of values, each associated with a case of an enum
public struct EnumMap<K: IterableEnum, V> {
    private var values: [V]
    
    /// Initialize an instance of this struct with a closure resolving an enum case into a value
    public init(valueResolver: K -> V) {
        self.values = EnumIterator<K>.map() {
            return valueResolver($0)
        }
    }
    
    /// Subscript support
    public subscript(key: K) -> V {
        return self.values[key.rawValue]
    }
    
    /// Run a closure on each value of this map
    public func forEach(closure: (K, V) -> Void) {
        for i in 0..<self.values.count {
            closure(K(rawValue: i)!, self.values[i])
        }
    }
}