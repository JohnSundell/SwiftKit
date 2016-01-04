import Foundation
import CoreGraphics

/// Protocol defining shared APIs for Direction types
public protocol DirectionType: RawRepresentable, Hashable, StringConvertible, UnboxableByTransform {
    /// The number of directions that this type contains
    static var count: Int { get }
    /// The radian value that represents the angle of this direction
    var radianValue: CGFloat { get }
    
    /// Initialize an instance of this Direction type with a string equivalent to a member name
    init?(string: String)
    /// Return the next clockwise direction
    func nextClockwiseDirection() -> Self
    /// Return the next counter clockwise direction
    func nextCounterClockwiseDirection() -> Self
    /// Return the opposite direction
    func oppositeDirection() -> Self
    /// Attempt to convert this direction into a four way direction
    func toFourWayDirection() -> Direction.FourWay?
    /// Convert this direction into an eight way direction
    func toEightWayDirection() -> Direction.EightWay
}

/// Structure acting as a namespace for enums describing directions
public struct Direction {
    /// An enum that describes a direction in any of 4 ways
    public enum FourWay: Int, DirectionType {
        public typealias UnboxRawValueType = String

        case Up
        case Right
        case Down
        case Left
        
        public static var count: Int {
            return 4
        }
        
        public static func lastValue() -> FourWay {
            return .Left
        }

        public init?(string: String) {
            switch string {
            case FourWay.Up.toString():
                self = .Up
            case FourWay.Right.toString():
                self = .Right
            case FourWay.Down.toString():
                self = .Down
            case FourWay.Left.toString():
                self = .Left
            default:
                return nil
            }
        }
        
        public func toString() -> String {
            switch self {
            case .Up:
                return "Up"
            case .Right:
                return "Right"
            case .Down:
                return "Down"
            case .Left:
                return "Left"
            }
        }
        
        public func toFourWayDirection() -> Direction.FourWay? {
            return self
        }
        
        public func toEightWayDirection() -> Direction.EightWay {
            return Direction.EightWay(self)
        }
    }
    
    /// An ennum that describes a direction in any of 8 ways
    public enum EightWay: Int, DirectionType {
        public typealias UnboxRawValueType = String

        case Up
        case UpRight
        case Right
        case RightDown
        case Down
        case DownLeft
        case Left
        case LeftUp
        
        public static var count: Int {
            return 8
        }
        
        public static func lastValue() -> EightWay {
            return .LeftUp
        }
        
        public init?(string: String) {
            switch string {
            case EightWay.Up.toString():
                self = .Up
            case EightWay.UpRight.toString():
                self = .UpRight
            case EightWay.Right.toString():
                self = .Right
            case EightWay.RightDown.toString():
                self = .RightDown
            case EightWay.Down.toString():
                self = .Down
            case EightWay.DownLeft.toString():
                self = .DownLeft
            case EightWay.Left.toString():
                self = .Left
            case EightWay.LeftUp.toString():
                self = .LeftUp
            default:
                return nil
            }
        }

        public init(_ fourWayDirection: FourWay) {
            switch fourWayDirection {
            case .Up:
                self = .Up
            case .Right:
                self = .Right
            case .Down:
                self = .Down
            case .Left:
                self = .Left
            }
        }
        
        public func toString() -> String {
            switch self {
            case .Up:
                return "Up"
            case .UpRight:
                return "UpRight"
            case .Right:
                return "Right"
            case .RightDown:
                return "RightDown"
            case .Down:
                return "Down"
            case .DownLeft:
                return "DownLeft"
            case .Left:
                return "Left"
            case .LeftUp:
                return "LeftUp"
            }
        }
        
        public func toFourWayDirection() -> Direction.FourWay? {
            switch self {
            case .Up:
                return .Up
            case .Right:
                return .Right
            case .Down:
                return .Down
            case .Left:
                return .Left
            case .UpRight, .RightDown, .DownLeft, .LeftUp:
                return nil
            }
        }
        
        public func toEightWayDirection() -> Direction.EightWay {
            return self
        }
    }
}

/// Default implementations of the DirectionType protocol
public extension DirectionType where RawValue: Number, UnboxRawValueType == String {
    var radianValue: CGFloat {
        return (CGFloat(M_PI * Double(2)) / CGFloat(Self.count())) * CGFloat(self.rawValue)
    }
    
    static func firstValue() -> Self {
        return Self(rawValue: RawValue(0))!
    }
    
    static func transformUnboxedValue(unboxedValue: String) -> Self? {
        return self.init(string: unboxedValue)
    }

    static func unboxFallbackValue() -> Self {
        return self.firstValue()
    }

    func nextClockwiseDirection() -> Self {
        return self.nextOrLoopAround()
    }
    
    func nextCounterClockwiseDirection() -> Self {
        return self.previous() ?? Self(rawValue: RawValue(Self.count - 1))!
    }
    
    func oppositeDirection() -> Self {
        var direction = self
        
        Repeat(Self.count / 2) {
            direction = direction.nextCounterClockwiseDirection()
        }
        
        return direction
    }
}

/// Extension for Arrays containing Dictionary values
public extension Array where Element: DirectionType {
    func toEightWayDirections() -> [Direction.EightWay] {
        var directions: [Direction.EightWay] = []
        
        for direction in self {
            directions.append(direction.toEightWayDirection())
        }
        
        return directions
    }
}
