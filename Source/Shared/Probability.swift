import Foundation

/// Struct that can be used to express first class probabilities
public struct Probability: FloatLiteralConvertible, Equatable {
    public typealias FloatLiteralType = Swift.FloatLiteralType
    
    private let value: FloatLiteralType
    
    public init(floatLiteral value: FloatLiteralType) {
        self.value = value
    }
    
    /// Return a random Bool value based on the probability
    public func toBool() -> Bool {
        let randomValue = FloatLiteralType(arc4random_uniform(100) + 1) / FloatLiteralType(100)
        return randomValue < self.value
    }
}

// MARK: Operators

public func ==(lhs: Probability, rhs: Probability) -> Bool {
    return lhs.value == rhs.value
}
