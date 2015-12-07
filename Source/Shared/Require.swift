import Foundation

/// Require that an optional is not nil, or throw an NSError
public func Require<T>(optional: Optional<T>) throws -> T {
    guard let value = optional else {
        throw NSError(name: "Required value was nil")
    }
    
    return value
}
