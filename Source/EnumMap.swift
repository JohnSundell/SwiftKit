import Foundation

/// A collection of values, each associated with a case of an enum
struct EnumMap<K: IterableEnum, V> {
    private var values: [V]
    
    /// Initialize an instance of this struct with a closure resolving an enum case into a value
    init(valueResolver: K -> V) {
        var values = [V]()
        
        EnumIterator<K>.iterate() {
            values.append(valueResolver($0))
        }
        
        self.values = values
    }
    
    /// Subscript support
    subscript(key: K) -> V {
        return self.values[key.rawValue]
    }
    
    /// Run a closure on each value of this map
    func forEach(closure: (K, V) -> Void) {
        for i in 0..<self.values.count {
            closure(K(rawValue: i)!, self.values[i])
        }
    }
}