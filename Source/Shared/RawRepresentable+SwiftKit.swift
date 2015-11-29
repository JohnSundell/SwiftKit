import Foundation

/// SwiftKit extensions to Number-based enums
public extension RawRepresentable where RawValue: Number, Self:Hashable {
    /// Iterate through each member of this enum (see EnumIterator for more options)
    public static func forEach(closure: Self -> Void) {
        EnumIterator.iterate(closure)
    }
    
    /// Go to the next member of the enum
    public func next() -> Self? {
        return Self(rawValue: RawValue(self.rawValue.toDouble() + 1))
    }
    
    /// Go to the member that corresponds to the current raw value advanced by n
    public func advancedBy(n: RawValue) -> Self? {
       return Self(rawValue: RawValue(self.rawValue + n))
    }
}
