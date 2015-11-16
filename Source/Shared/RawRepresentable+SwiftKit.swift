import Foundation

/// Extension that enables enums with a Number raw value to be strideable
public extension RawRepresentable where RawValue: Number {
    /// Go to the next member of the enum
    public func next() -> Self? {
        return Self(rawValue: RawValue(self.rawValue.toDouble() + 1))
    }
    
    /// Go to the member that corresponds to the current raw value advanced by n
    public func advancedBy(n: RawValue) -> Self? {
       return Self(rawValue: RawValue(self.rawValue + n))
    }
}
