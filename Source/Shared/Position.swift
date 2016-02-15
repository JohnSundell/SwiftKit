import Foundation
import CoreGraphics

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
    
    /// Return a new position by offsetting this position
    public func positionOffsetByX(x: T, y: T) -> Position_2D<T> {
        return Position_2D(x: (self.x + x) as T, y: (self.y + y) as T)
    }
    
    /// Return a new position by moving this position by 1 unit in a direction
    public func positionInDirection(direction: Direction.FourWay, coordinateSystem: CoordinateSystem = .OriginUpperLeft) -> Position_2D<T> {
        switch direction {
        case .Up:
            if coordinateSystem.incrementalVerticalDirection == .Up {
                return Position_2D(x: self.x, y: (self.y + 1) as T)
            } else {
                return Position_2D(x: self.x, y: (self.y - 1) as T)
            }
        case .Right:
            return Position_2D(x: (self.x + 1) as T, y: self.y)
        case .Down:
            if coordinateSystem.incrementalVerticalDirection == .Down {
                return Position_2D(x: self.x, y: (self.y + 1) as T)
            } else {
                return Position_2D(x: self.x, y: (self.y - 1) as T)
            }
        case .Left:
            return Position_2D(x: (self.x - 1) as T, y: self.y)
        }
    }
    
    /// Conver this position into a CGPoint with equivalent x & y values
    public func toCGPoint() -> CGPoint {
        return CGPoint(x: CGFloat(self.x), y: CGFloat(self.y))
    }
    
    /// Convert this position into a CGPoint with a certain Position:CGPoint ratio
    public func toCGPointWithRatio(ratio: CGFloat) -> CGPoint {
        return CGPoint(x: CGFloat(self.x) * ratio, y: CGFloat(self.y) * ratio)
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

// Equatable support for Position_2D
public func ==<T: Number>(lhs: Position_2D<T>, rhs: Position_2D<T>) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// Equatable support for Position_3D
public func ==<T: Number>(lhs: Position_3D<T>, rhs: Position_3D<T>) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
