import Foundation

/// A collection of values, each associated with a case of an enum
public struct EnumMap<K: IterableEnum, V> {
    public private(set) var values: [V]
    
    /// Initialize an instance of this struct with a closure resolving an enum case into a value
    public init(valueResolver: K -> V) {
        self.values = EnumIterator<K>.map() {
            return valueResolver($0)
        }
    }
    
    /// Initialize an empty instance of this struct with a default value that will be set for all enum members
    public init(defaultValue: V) {
        self.init(valueResolver: { K in
            return defaultValue
        })
    }
    
    /// Subscript support
    public subscript(key: K) -> V {
        get {
            return self.values[Int(key.rawValue)]
        }
        set {
            self.values[Int(key.rawValue)] = newValue
        }
    }
    
    /// Run a closure on each value of this map
    public func forEach(closure: (K, V) -> Void) {
        for i in 0..<self.values.count {
            closure(K(rawValue: K.RawType(i))!, self.values[i])
        }
    }
}