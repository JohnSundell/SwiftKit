import Foundation

/// A collection of values, each associated with a case of an enum
public struct EnumMap<K: RawRepresentable, V where K.RawValue: Number, K: Hashable> {
    public private(set) var values: [K : V]
    
    /// Initialize an instance of this struct with a closure resolving an enum case into a value
    public init(valueResolver: K -> V) {
        self.values = EnumIterator<K>.map() {
            return valueResolver($0)
        }
    }
    
    /// Initialize an empty instance of this struct with a default value that will be set for all enum members
    public init(_ defaultValue: V) {
        self.init(valueResolver: { K in
            return defaultValue
        })
    }
    
    /// Subscript support
    public subscript(key: K) -> V {
        get {
            return self.values[key]!
        }
        set {
            self.values[key] = newValue
        }
    }
    
    /// Run a closure on each value of this map
    public func forEach(closure: (K, V) -> Void) {
        EnumIterator<K>.iterate() {
            closure($0, self.values[$0]!)
        }
    }
}