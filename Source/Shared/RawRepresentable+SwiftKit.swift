import Foundation

/// SwiftKit extensions to Number-based enums
public extension RawRepresentable where RawValue: Number, Self:Hashable {
    /// Iterate through each member of this enum (see EnumIterator for more options)
    public static func forEach(closure: Self -> Void) {
        EnumIterator.forEach(closure)
    }
    
    /// Count the members of this enum, by iterating through each member
    public static func count() -> Int {
        return self.all().count
    }
    
    /// Return all members of this enum, by iterating through it and collecting each one
    public static func all() -> [Self] {
        var values = [Self]()
        
        Self.forEach({
            values.append($0)
        })

        return values
    }
    
    /// Return the first member of the enum (minimum raw value)
    public static func first() -> Self {
        var rawValue = RawValue(0)
        var first = Self(rawValue: rawValue)
        
        while true {
            if let first = first {
                return first
            }
            
            rawValue++
            first = Self(rawValue: rawValue)
        }
    }
    
    /// Go to the next member of the enum
    public func next() -> Self? {
        return self.advancedBy(RawValue(1))
    }
    
    /// Go the previous member of the enum
    public func previous() -> Self? {
        return self.advancedBy(RawValue(-1))
    }
    
    /// Go to the member that corresponds to the current raw value advanced by n
    public func advancedBy(n: RawValue) -> Self? {
       return Self(rawValue: RawValue(self.rawValue + n))
    }
}
