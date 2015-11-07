import Foundation

/// Structure acting as a namespace for enums describing directions
public struct Direction {
    /// An enum that describes a direction in any of 4 ways
    public enum FourWay: Int {
        case Up
        case Right
        case Down
        case Left
    }
    
    /// An ennum that describes a direction in any of 8 ways
    public enum EightWay: Int {
        case Up
        case UpRight
        case Right
        case RightDown
        case Down
        case DownLeft
        case Left
        case LeftUp
        
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
