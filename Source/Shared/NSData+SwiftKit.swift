import Foundation

/// SwiftKit extensions to NSData
public extension NSData {
    /// Attempt to initialize an instance of NSData using a local JSON file, or throw an NSError
    public convenience init(JSONFileNamed fileName: String) throws {
        guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") else {
            throw NSError(name: "Invalid JSON file name: \(fileName)")
        }
        
        try self.init(contentsOfFile: path, options: [])
    }
}
