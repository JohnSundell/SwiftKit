import Foundation

/// Attempt to unwrap an optional, and if it's nil - return a default value
public func Unwrap<T>(variable: T?, @autoclosure defaultValue: () -> T) -> T {
    return variable ?? defaultValue()
}

/// Attempt to unwrap an optional, and if it's nil - return a value from a closure
public func Unwrap<T>(variable: T?, or defaultValueClosure: () -> T) -> T {
    return variable ?? defaultValueClosure()
}
