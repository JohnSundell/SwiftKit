import Foundation
import CoreGraphics

/// Unbox a local JSON file with a contextual object
public func UnboxLocalFileWithName<T: UnboxableWithContext>(fileName: String, context: T.ContextType) -> T? {
    guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") else {
        return nil
    }
    
    guard let data = NSData(contentsOfFile: path) else {
        return nil
    }
    
    return Unbox(data, context: context)
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
