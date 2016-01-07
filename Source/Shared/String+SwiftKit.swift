import Foundation

/// SwiftKit extensions to the standard library String struct
public extension String {
    /// The length of the string as an Int
    public var length: Int { return self.characters.count }
}

/// Make String a StringConvertible type that returns itself
extension String: StringConvertible {
    public func toString() -> String {
        return self
    }
}
