import Foundation

/// Attempt to unwrap an optional, and if it's nil - return a default value
public func Unwrap<T>(variable: T?, @autoclosure defaultValue: () -> T) -> T {
    if let unwrapped = variable {
        return unwrapped
    }
    
    return defaultValue()
}