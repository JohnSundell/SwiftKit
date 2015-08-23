import Foundation

/// SwiftKit extensions to the standard library Array
public extension Array {
    /// Return the value at an index, or nil if the index is out of the array's bounds
    public func valueAtIndex(index: Int) -> Element? {
        if index < 0 || index >= self.count {
            return nil
        }
        
        return self[index]
    }
    
    /// Turn this array into a dictionary where each key is an index from this array
    public func toDictionary() -> [Int : Element] {
        return self.toDictionary({ $0 })
    }
    
    /// Turn this array into a dictionary where each key is a transformed index from this array
    public func toDictionary<K>(indexToKey: Int -> K) -> [K : Element] {
        var dictionary = [K : Element]()
        
        for var index = 0, count = self.count; index < count; index++ {
            dictionary[indexToKey(index)] = self[index]
        }
        
        return dictionary
    }
}
