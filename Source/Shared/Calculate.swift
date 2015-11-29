import Foundation

/// Function that can be used to encapsulate code using closures
public func Calculate<T>(@noescape closure: () throws -> T) rethrows -> T {
    return try closure()
}