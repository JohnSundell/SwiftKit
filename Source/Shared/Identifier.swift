import Foundation

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
    public typealias UnboxTransformerType = IdentifierUnboxTransformer
}

/// An Unbox transformer that can transform Strings into `Identifier` instances
public class IdentifierUnboxTransformer: UnboxTransformer {
    public typealias RawType = String
    public typealias TransformedType = Identifier
    
    public static func transformUnboxedValue(unboxedValue: RawType) -> TransformedType? {
        return Identifier(identifierString: unboxedValue)
    }
    
    public static func fallbackValue() -> TransformedType {
        return Identifier()
    }
}
