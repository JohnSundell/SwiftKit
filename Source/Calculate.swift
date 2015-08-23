import Foundation

/// Function that can be used to encapsulate code using closures
public func Calculate<T>(@noescape closure: () -> T) -> T {
    return closure()
}