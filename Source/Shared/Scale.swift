import Foundation
import CoreGraphics

/// Structure acting as a namespace for types describing scales
public struct Scale<T: Number> {
    public typealias TwoDimensional = Scale_2D<T>
}

/// Structure describing a two-dimensional scale
public struct Scale_2D<T: Number>: Hashable, EmptyInitializable {
    public var hashValue: Int { return "\(self.x):\(self.y)".hashValue }
    
    public var x: T
    public var y: T
    
    /// Initialize a value, nil = 1
    public init(x: T, y: T? = nil) {
        self.x = x ?? T(1)
        self.y = y ?? T(1)
    }
    
    /// Initialize an empty value (scale = 1)
    public init() {
        self.init(x: T(1), y: T(1))
    }
}

// MARK: - Operators

// Equatable support for Scale_2D
public func ==<T: Number>(lhs: Scale_2D<T>, rhs: Scale_2D<T>) -> Bool {
    return lhs.hashValue == rhs.hashValue
}