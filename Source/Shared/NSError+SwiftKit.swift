import Foundation

/// SwiftKit extensions to NSError
public extension NSError {
    /// Create an error object with a given name and a default status code
    public convenience init(name: String) {
        self.init(domain: name, code: 1, userInfo: [NSUnderlyingErrorKey: name])
    }
}
