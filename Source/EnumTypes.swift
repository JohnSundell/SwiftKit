import Foundation

/// Protocol that can be used as a constraint for Enums that inherit from `Int`
public protocol IntEnum {
    init?(rawValue: Int)
    var rawValue: Int { get }
}