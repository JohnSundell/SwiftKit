import Foundation

/// Protocol that can be used to define enums that are loopable
public protocol LoopableEnum: RawRepresentable {
    /// The first member of the enum
    static func firstValue() -> Self
    /// The last member of the enum
    static func lastValue() -> Self
}

/// Extension for loopable enums
public extension LoopableEnum where RawValue: Number {
    /// Go to the next member of the enum, or loop to the first member
    func next() -> Self {
        return Self(rawValue: RawValue(self.rawValue.toDouble() + 1)) ?? Self.firstValue()
    }
    
    /// Go to the previous member of the enum, or loop to the last member
    func previous() -> Self {
        if self.rawValue.toDouble() >= 1 {
            if let previous = Self(rawValue: RawValue(self.rawValue.toDouble() - 1)) {
                return previous
            }
        }
        
        return Self.lastValue()
    }
}
