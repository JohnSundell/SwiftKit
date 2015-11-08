import Foundation

/// Structure acting as a namespace for types describing positions
public struct Position<T: Number> {
    public typealias TwoDimensional = Position_2D<T>
    public typealias ThreeDimensional = Position_3D<T>
}

/// Structure describing a two-dimensional position
public struct Position_2D<T: Number>: Hashable {
    public var hashValue: Int { return "\(self.x):\(self.y)".hashValue }
    
    public var x: T
    public var y: T
    
    /// Initialize a value, nil = 0
    public init(x: T? = nil, y: T? = nil) {
        self.x = x ?? T(0)
        self.y = y ?? T(0)
    }
}

/// Structure describing a three-dimensional position
public struct Position_3D<T: Number>: Hashable {
    public var hashValue: Int { return "\(self.x):\(self.y):\(self.z)".hashValue }
    
    public var x: T
    public var y: T
    public var z: T
    
    /// Initialize a value, nil = 0
    public init(x: T? = nil, y: T? = nil, z: T? = nil) {
        self.x = x ?? T(0)
        self.y = y ?? T(0)
        self.z = z ?? T(0)
    }
}
