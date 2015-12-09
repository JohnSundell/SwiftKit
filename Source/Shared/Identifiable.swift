import Foundation

/// Protocol implemented by types that have a unique identifier
public protocol Identifiable {
    /// The object's unique identifier
    var identifier: Identifier { get }
}
