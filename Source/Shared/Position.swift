import Foundation

/// Structure acting as a namespace for types describing positions
public struct Position<T: Number> {
    public typealias TwoDimensional = Position_2D<T>
    public typealias ThreeDimensional = Position_3D<T>
}

/// Structure describing a two-dimensional position
public struct Position_2D<T: Number>: Hashable, EmptyInitializable {
    public var hashValue: Int { return "\(self.x):\(self.y)".hashValue }
    
    public var x: T
    public var y: T
    
    /// Initialize a value, nil = 0
    public init(x: T? = nil, y: T? = nil) {
        self.x = x ?? T(0)
        self.y = y ?? T(0)
    }
    
    /// Initialize an empty value
    public init() {
        self.init(x: nil, y: nil)
    }
}

/// Extension making 2D Positions usable as Unboxable keys
extension Position_2D: UnboxableKey {
    public static func transformUnboxedKey(unboxedKey: String) -> Position_2D<T>? {
        let parts = unboxedKey.componentsSeparatedByString(":")
        
        guard let first = parts.first, last = parts.last where parts.count == 2 else {
            return nil
        }
        
        guard let x = T(string: first), y = T(string: last) else {
            return nil
        }
        
        return self.init(x: x, y: y)
    }
}

/// Structure describing a three-dimensional position
public struct Position_3D<T: Number>: Hashable, EmptyInitializable {
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
    
    /// Initialize an empty value
    public init() {
        self.init(x: nil, y: nil, z: nil)
    }
}

/// Extension making 3D Positions usable as Unboxable keys
extension Position_3D: UnboxableKey {
    public static func transformUnboxedKey(unboxedKey: String) -> Position_3D<T>? {
        let parts = unboxedKey.componentsSeparatedByString(":")
        
        guard let first = parts.first, middle = parts.valueAtIndex(1), last = parts.last where parts.count == 3 else {
            return nil
        }
        
        guard let x = T(string: first), y = T(string: middle), z = T(string: last) else {
            return nil
        }
        
        return self.init(x: x, y: y, z: z)
    }
}
