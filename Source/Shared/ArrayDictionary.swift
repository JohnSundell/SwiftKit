import Foundation

/// Dictionary-like structure that manages a set of arrays for each key
public struct ArrayDictionary<Key: Hashable, ArrayValue> {
    /// The key contained within this structure
    public var keys: [Key] { return Array(self.dictionary.keys) }
    
    private var dictionary: [Key : [ArrayValue]]
    
    /// Create a new instance of this structure
    public init() {
        self.dictionary = [:]
    }
    
    /// Subscript support
    public subscript(key: Key) -> [ArrayValue]? {
        get {
            return self.dictionary[key]
        }
        set {
            self.dictionary[key] = newValue
        }
    }
    
    /// Insert a value into this stucture. If an existing array exists, it will be appended.
    public mutating func insertValue(value: ArrayValue, intoArrayForKey key: Key) {
        if var arrayForKey = self[key] {
            arrayForKey.append(value)
            self.dictionary[key] = arrayForKey
        } else {
            self.dictionary[key] = [value]
        }
    }
}