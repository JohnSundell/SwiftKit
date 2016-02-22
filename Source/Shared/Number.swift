import Foundation
import CoreGraphics

/// Protocol that may be used to constrain a generic to numeric types
public protocol Number: Quantifiable, StringConvertible {
    /// Initialize an instance with another Number
    init(_ number: Number)
    /// Initialize an instance with a double value
    init(_ double: Double)
}

/// Addition support for Number types
public func +<T: Number>(lhs: Number, rhs: Number) -> T {
    return T(lhs.toDouble() + rhs.toDouble())
}

/// Subtraction support for Number types
public func -<T: Number>(lhs: Number, rhs: Number) -> T {
    return T(lhs.toDouble() - rhs.toDouble())
}

/// Multiplication support for Number types
public func *<T: Number>(lhs: Number, rhs: Number) -> T {
    return T(lhs.toDouble() * rhs.toDouble())
}

/// Division support for Number types
public func /<T: Number>(lhs: Number, rhs: Number) -> T {
    return T(lhs.toDouble() / rhs.toDouble())
}

/// Postfix increment support for Number types
public postfix func ++<T: Number>(inout number: T) -> T {
    number = T(number.toDouble() + 1)
    return number
}

/// Postfix decrement support for Number types
public postfix func --<T: Number>(inout number: T) -> T {
    number = T(number.toDouble() - 1)
    return number
}

/// Convenience API for Number types
public extension Number {
    /// The fractional part of the number's value
    public var fractionalValue: Self { return self - self.floor() }
    
    /// The absolute value for this number
    public var absoluteValue: Self { return Self(abs(self.toDouble())) }
    
    /// Attempt to initialize a value with a string
    public init?(string: String) {
        guard let doubleValue = Double(string) else {
            return nil
        }
        
        self.init(doubleValue)
    }
    
    /// Return a value that is the result of flooring this value
    public func floor() -> Self {
        return Self(Foundation.floor(self.toDouble()))
    }
    
    /// Return a (potentially) rounded value that contains a maximum number of decimals
    public func roundedValueWithDecimalCount(decimalCount: UInt) -> Self {
        let coefficient = pow(10, Double(decimalCount))
        return round(self.toDouble() * coefficient) / coefficient
    }
    
    /// Return whether this number is evenly (non-fractional) divisible by another number
    public func isEvenlyDivisibleBy(number: Number) -> Bool {
        return self.toDouble() % number.toDouble() == 0
    }
    
    /// Return a string representation of the number
    public func toString() -> String {
        return "\(self)"
    }
}

/// Extension that makes Int conform to Number
extension Int: Number {
    public init(_ number: Number) {
        self.init(number.toDouble())
    }
    
    public func toDouble() -> Double {
        return Double(self)
    }
}

/// Extension that makes UInt conform to Number
extension UInt: Number {
    public init(_ number: Number) {
        self.init(number.toDouble())
    }
    
    public func toDouble() -> Double {
        return Double(self)
    }
}

/// Extension that makes UInt32 conform to Number
extension UInt32: Number {
    public init(_ number: Number) {
        self.init(number.toDouble())
    }
    
    public func toDouble() -> Double {
        return Double(self)
    }
}

/// Extension that makes Double conform to Number
extension Double: Number {
    public init(_ number: Number) {
        self.init(number.toDouble())
    }
    
    public func toDouble() -> Double {
        return self
    }
}

/// Extension that makes CGFloat conform to Number
extension CGFloat: Number {
    public init(_ number: Number) {
        self.init(number.toDouble())
    }
    
    public func toDouble() -> Double {
        return Double(self)
    }
}