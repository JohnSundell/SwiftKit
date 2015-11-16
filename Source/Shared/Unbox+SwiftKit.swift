import Foundation

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
