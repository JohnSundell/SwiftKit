import Foundation

/// Protocol that can be used to constrain collections as being indexed by keys
public protocol KeyedCollection: CollectionType, EmptyInitializable {
    associatedtype Key: Hashable
    associatedtype Value
    
    /// Return the value for a key
    func valueForKey(key: Key) -> Value?
    /// Add a value to this collection for a certain key
    mutating func setValue(value: Value?, forKey key: Key)
}

/// Make the standard library Dictionary conform to KeyedCollection
extension Dictionary: KeyedCollection {
    public func valueForKey(key: Key) -> Value? {
        return self[key]
    }
    
    public mutating func setValue(value: Value?, forKey key: Key) {
        self[key] = value
    }
}

/// Convenience API for nested keyed collections
public extension KeyedCollection where Value: KeyedCollection, Value: EmptyInitializable {
    /// Insert a value into a nested keyed collection
    public mutating func insertValue(value: Value.Value, forKey key: Value.Key, intoCollectionForKey collectionKey: Key) {
        var collection = self.valueForKey(collectionKey) ?? Value()
        collection.setValue(value, forKey: key)
        self.setValue(collection, forKey: collectionKey)
    }
    
    /// Remove a value from a nested keyed collection
    public mutating func removeValueForKey(key: Value.Key, fromCollectionForKey collectionKey: Key) {
        var collection = self.valueForKey(collectionKey)
        collection?.setValue(nil, forKey: key)
        self.setValue(collection, forKey: collectionKey)
    }
}
