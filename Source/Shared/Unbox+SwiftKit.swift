import Foundation
import CoreGraphics
import Unbox

/// Unbox a local JSON file, or throw NSError (invalid data) or UnboxError (unboxing failed)
public func UnboxLocalFileWithName<T: Unboxable>(fileName: String) throws -> T {
    return try UnboxOrThrow(NSData(JSONFileNamed: fileName))
}

/// Unbox a local JSON file with a contextual object, or throw NSError (invalid data) or UnboxError (unboxing failed)
public func UnboxLocalFileWithName<T: UnboxableWithContext>(fileName: String, context: T.ContextType) throws -> T {
    return try UnboxOrThrow(NSData(JSONFileNamed: fileName), context: context)
}

/// Extension making CGSize Unboxable
extension CGSize: Unboxable {
    public init(unboxer: Unboxer) {
        self.init(
            width: unboxer.unbox("width") as CGFloat,
            height: unboxer.unbox("height") as CGFloat
        )
    }
}

/// Extension providing a default fallback value implementation for EmptyInitializable types
public extension UnboxCompatibleType where Self: EmptyInitializable {
    static func unboxFallbackValue() -> Self {
        return self.init()
    }
}
