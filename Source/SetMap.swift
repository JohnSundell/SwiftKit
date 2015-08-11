import Foundation

/// A structure that stores sets of values associated with keys
public struct SetMap<KeyType: Hashable, ValueType: Hashable> {
    private var map: [KeyType : Set<ValueType>]
    
    // MARK: - Public
    
    /// Initialize an instance of SetMap
    public init() {
        self.map = [KeyType : Set<ValueType>]()
    }
    
    /// Subscripting support
    public subscript(key: KeyType) -> Set<ValueType>? {
        return self.valuesForKey(key)
    }
    
    /// Return all values associated with a certain key
    public func valuesForKey(key: KeyType) -> Set<ValueType>? {
        return self.map[key]
    }
    
    /// Insert a value, and associate it with a certain key
    public mutating func insertValue(value: ValueType, forKey key: KeyType) {
        self.performOperation({
            var array = $0
            array.insert(value)
            
            return array
        }, onSetForKey: key)
    }
    
    /// Remove a value associated with a certain key
    public mutating func removeValue(value: ValueType, forKey key: KeyType) -> ValueType? {
        var removedValue: ValueType?
        
        self.performOperation({
            var set = $0
            removedValue = set.remove(value)
            
            return set
        }, onSetForKey: key)
        
        return removedValue
    }
    
    // MARK: - Private
    
    private mutating func performOperation(operation: Set<ValueType> -> Set<ValueType>, onSetForKey key: KeyType) {
        let set: Set<ValueType> = Calculate() {
            if let set = self.map[key] {
                return set
            }
            
            return []
        }
        
        self.map[key] = operation(set)
    }
}