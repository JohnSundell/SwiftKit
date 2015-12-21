import Foundation

/// SwiftKit extensions to the standard library Dictionary
public extension Dictionary {
    /// Transform this dictionary into another one by applying a transform on each key/value pair
    public func transform<K: Hashable, V>(transformation: (Key, Value) -> (key: K, value: V)) -> [K : V] {
        var transformed = [K : V]()
        
        for (key, value) in self {
            let transformedPair = transformation(key, value)
            transformed[transformedPair.key] = transformedPair.value
        }
        
        return transformed
    }
}

/// Extension to the standard library Dictionary that makes it easier to work with nested collections
public extension Dictionary where Value: MutableIndexedCollectionType, Value: EmptyInitializable {
    /// Insert a value into a nested collection
    public mutating func insertValue(value: Value.Generator.Element, intoCollectionForKey key: Key) {
        var collection = self[key] ?? Value()
        collection.insert(value)
        self[key] = collection
    }
    
    /// Remove a value at a certain index from a nested collection
    public mutating func removeValueAtIndex(index: Value.Index, fromCollectionForKey key: Key) {
        guard var collection = self[key] else {
            return
        }
        
        collection.removeAtIndex(index)
        self[key] = collection
    }
}

/// Convenience APIs for nested mutable indexed collections where the values are equatable
public extension Dictionary where Value: MutableIndexedCollectionType, Value.Generator.Element: Equatable {
    /// Remove a value from a nested collection by finding it
    public mutating func removeValue(value: Value.Generator.Element, fromCollectionForKey key: Key) {
        guard var collection = self[key] else {
            return
        }
        
        guard let index = collection.indexOf(value) else {
            return
        }
        
        collection.removeAtIndex(index)
        self[key] = collection
    }
}
