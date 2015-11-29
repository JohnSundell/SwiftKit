import Foundation

/// Struct that can be used to treat localized strings as first-class objects
public struct LocalizedString: StringLiteralConvertible {
    public typealias StringLiteralType = Swift.StringLiteralType
    public typealias ExtendedGraphemeClusterLiteralType = Swift.ExtendedGraphemeClusterType
    public typealias UnicodeScalarLiteralType = UnicodeScalarType
    
    /// The final, localized string
    public let string: String
    
    /// Initialize with a localization identifier
    public init(_ identifier: String) {
        self.string = NSLocalizedString(identifier, comment: "")
    }
    
    /// Initialize with a localization identifier and format arguments
    public init(identifier: String, arguments: CVarArgType...) {
        self.string = String(format: NSLocalizedString(identifier, comment: ""), arguments: arguments)
    }
    
    // MARK: - StringLiteralConvertible
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(stringLiteral: value)
    }
}
