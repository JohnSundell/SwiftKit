import Foundation

/// Require that an optional is not nil, or throw an NSError
public func Require<T>(optional: Optional<T>) throws -> T {
    guard let value = optional else {
        throw NSError(name: "Required value was nil")
    }
    
    return value
}

/// Require that a value is not nil, and that it may be cast to another type, or throw an NSError
public func RequireAndCast<A, B>(value: A?) throws -> B {
    guard let value = try Require(value) as? B else {
        throw NSError(name: "Could not perform cast")
    }
    
    return value
}

/// Require that an expression avaluates to true, or throw an NSError
public func Require(@autoclosure expression: () -> Bool) throws {
    if !expression() {
        throw NSError(name: "Requirement not fulfilled")
    }
}
