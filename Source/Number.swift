import Foundation
import CoreGraphics

/// Protocol that may be used to constrain a generic to numeric types
public protocol Number {
    /// Initialize an instance with another Number
    init(_ number: Number)
    /// Initialize an instance with a double value
    init(_ double: Double)
    /// Convert the instance into a double value
    func toDouble() -> Double
}

/// Addition support for Number types
public func +<T: Number>(lhs: T, rhs: T) -> T {
    return T(lhs.toDouble() + rhs.toDouble())
}

/// Multiplication support for Number types
public func *<T: Number>(lhs: T, rhs: T) -> T {
    return T(lhs.toDouble() * rhs.toDouble())
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

/// Extensiion that makes CGFloat conform to Number
extension CGFloat: Number {
    public init(_ number: Number) {
        self.init(number.toDouble())
    }
    
    public func toDouble() -> Double {
        return Double(self)
    }
}