import Foundation

/// Require that an optional is not nil, or throw an NSError (with an optional explicit message)
public func Require<T>(optional: Optional<T>, errorMessage: String? = nil) throws -> T {
    guard let value = optional else {
        throw NSError(name: "Required value was nil")
    }
    
    return value
}

/// Require that a value is not nil, and that it may be cast to another type, or throw an NSError (with an optional explicit message)
public func RequireAndCast<A, B>(value: A?, errorMessage: String? = nil) throws -> B {
    guard let value = try Require(value, errorMessage: errorMessage) as? B else {
        throw NSError(name: errorMessage ?? "Could not perform cast")
    }
    
    return value
}

/// Require that an expression avaluates to true, or throw an NSError (with an optional explicit message)
public func Require(@autoclosure expression: () -> Bool, errorMessage: String? = nil) throws {
    if !expression() {
        throw NSError(name: errorMessage ?? "Requirement not fulfilled")
    }
}
