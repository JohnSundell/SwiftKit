import Foundation

/**
 *  Class for iterating through each member of a linear, Number-based enum
 *
 *  Example usage:
 *
 *  ```
 *  let iterator = EnumIterator<MyEnum>()
 *
 *  while let value = iterator.next() {
 *      // Do something for each member
 *  }
 *  ```
 */
public final class EnumIterator<T: RawRepresentable where T.RawValue: Number, T: Hashable> {
    private var currentValue: T?
    
    /// Initialize an instance of EnumIterator, optionally with a value to start from (inclusive)
    public init(startValue: T? = nil) {
        self.currentValue = startValue?.previous()
    }
    
    /// Go to the next member of the enum that this instance is for and return it, or return nil if no more members exist
    public func next() -> T? {
        let nextValue: T? = Calculate {
            if let currentValue = self.currentValue {
                return currentValue.next()
            }
            
            return T.first()
        }
        
        self.currentValue = nextValue
        return nextValue
    }
}

/// Extension adding convenience class APIs to EnumIterator
public extension EnumIterator {
    /// Iterate through each member of the enum that this class is for, and execute a closure for each one
    public class func forEach(@noescape forEachCase: T -> Void) {
        let iterator = EnumIterator()
        
        while let value = iterator.next() {
            forEachCase(value)
        }
    }
    
    /// Map an array of values from each member of the enum that this class is for
    public class func map<M>(@noescape forEachCase: T -> M) -> [M] {
        var mapped = [M]()
        
        self.forEach() {
            mapped.append(forEachCase($0))
        }
        
        return mapped
    }
    
    /// Map a dictionary of values from each member of the enum that this class is for, with the members as keys
    public class func map<M>(@noescape forEachCase: T -> M) -> [T : M] {
        var mapped = [T : M]()
        
        self.forEach() {
            mapped[$0] = forEachCase($0)
        }
        
        return mapped
    }
}