import Foundation

/// Protocol defining shared APIs for Direction types
public protocol DirectionType: LoopableEnum, UnboxableByTransform {
    /// Initialize an instance of this Direction type with a string equivalent to a member name
    init?(string: String)
    /// Return the next clockwise direction
    func nextClockwiseDirection() -> Self
    /// Return the next counter clockwise direction
    func nextCounterClockwiseDirection() -> Self
    /// Return the opposite direction
    func oppositeDirection() -> Self
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
        
        public static func lastValue() -> FourWay {
            return .Left
        }

        public init?(string: String) {
            switch string {
            case "Up":
                self = .Up
            case "Right":
                self = .Right
            case "Down":
                self = .Down
            case "Left":
                self = .Left
            default:
                return nil
            }
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
        
        public static func lastValue() -> EightWay {
            return .LeftUp
        }
        
        public init?(string: String) {
            switch string {
            case "Up":
                self = .Up
            case "UpRight":
                self = .UpRight
            case "Right":
                self = .Right
            case "RightDown":
                self = .RightDown
            case "Down":
                self = .Down
            case "DownLeft":
                self = .DownLeft
            case "Left":
                self = .Left
            case "LeftUp":
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
    }
}

/// Default implementations of the DirectionType protocol
public extension DirectionType where RawValue: Number, UnboxRawValueType == String {
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
        return self.next()
    }
    
    func nextCounterClockwiseDirection() -> Self {
        return self.previous()
    }
    
    func oppositeDirection() -> Self {
        let numberOfDirections: Int = Self.lastValue().rawValue + 1
        var direction = self
        
        Repeat(numberOfDirections / 2) {
            direction = direction.nextCounterClockwiseDirection()
        }
        
        return direction
    }
}
