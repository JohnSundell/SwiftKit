import Foundation
import Unbox

/// Serialize an array of objects that conform to Serializable
public func Serialize<T: Serializable>(array: [T]) -> [UnboxableDictionary] {
    return array.map() {
        return $0.serialize()
    }
}
