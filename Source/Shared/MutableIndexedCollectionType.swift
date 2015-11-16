import Foundation

/// Protocol that can be used to constrain types to being mutable indexed collection types
public protocol MutableIndexedCollectionType: CollectionType, EmptyInitializable {
    /// Insert a value into the collection
    mutating func insert(value: Generator.Element)
    /// Remove a value at a certain index from the collection
    mutating func removeAtIndex(index: Index) -> Generator.Element
}

/// Extension that makes the standard library Array conform to MutableIndexedCollectionType
extension Array: MutableIndexedCollectionType {
    public mutating func insert(value: Generator.Element) {
        self.append(value)
    }
}

/// Extension that makes the standard library Set conform to MutableIndexedCollectionType
extension Set: MutableIndexedCollectionType { }
