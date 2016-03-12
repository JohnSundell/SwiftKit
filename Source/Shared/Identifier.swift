import Foundation
import Unbox

/// A structure that can be used as a value-type replacement for NSUUID
public struct Identifier: Hashable {
    public var hashValue: Int { return self.identifierString.hashValue }
    public let identifierString: String
    
    public init() {
        self.identifierString = NSUUID().UUIDString
    }
    
    public init?(identifierString: String) {
        if let UUID = NSUUID(UUIDString: identifierString) {
            self.identifierString = UUID.UUIDString
        } else {
            return nil
        }
    }
}

/// Equatable support for Identifier
public func ==(lhs: Identifier, rhs: Identifier) -> Bool {
    return lhs.identifierString == rhs.identifierString
}

/// Unbox support for Identifier
extension Identifier: UnboxableByTransform {
    public typealias UnboxRawValueType = String
    
    public static func transformUnboxedValue(unboxedValue: String) -> Identifier? {
        return Identifier(identifierString: unboxedValue)
    }
    
    public static func unboxFallbackValue() -> Identifier {
        return Identifier()
    }
}

/// Wrap support for Identifier
extension Identifier: WrapCustomizable {
    public func wrap() -> AnyObject? {
        return self.identifierString
    }
}
