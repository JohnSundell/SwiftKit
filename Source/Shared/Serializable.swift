import Foundation
import Unbox

/// Protocol adopted by objects that are representable by a serialized dictionary
public protocol Serializable {
    /// Serialize the object into a dictionary
    func serialize() -> UnboxableDictionary
}
