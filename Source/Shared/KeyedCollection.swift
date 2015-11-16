import Foundation

/// Protocol that can be used to constrain collections as being indexed by keys
public protocol KeyedCollection {
    typealias Key
    typealias Value
    
    subscript(key: Key) -> Value? { get }
}

/// Make the standard library Dictionary conform to KeyedCollection
extension Dictionary: KeyedCollection { }