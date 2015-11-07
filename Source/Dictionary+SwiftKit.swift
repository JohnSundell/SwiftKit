import Foundation

/// SwiftKit extensions to the standard library Dictionary
public extension Dictionary {
    /// Transform this dictionary into another one by applying a transform on each key/value pair
    func transform<K: Hashable, V>(transformation: (Key, Value) -> (key: K, value: V)) -> [K : V] {
        var transformed = [K : V]()
        
        for (key, value) in self {
            let transformedPair = transformation(key, value)
            transformed[transformedPair.key] = transformedPair.value
        }
        
        return transformed
    }
}
