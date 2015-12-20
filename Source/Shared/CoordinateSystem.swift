import Foundation

/// Enum describing various coordinate system variations. Useful when writing cross-platform code.
public enum CoordinateSystem {
    /// The coordinate system has its orgin in the upper left corner of the matrix
    case OriginUpperLeft
    /// The coordinate system has its origin in the lower left cordner of the matrix
    case OriginLowerLeft
}

/// Extension providing convenience accessors for known coordinate system types
public extension CoordinateSystem {
    /// The coordinate system type used by UIKit
    public static var UIKit: CoordinateSystem {
        return .OriginUpperLeft
    }
    
    /// The coordinate system type used by AppKit
    public static var AppKit: CoordinateSystem {
        return .OriginLowerLeft
    }
    
    /// The coordinate system type used by SpriteKit
    public static var SpriteKit: CoordinateSystem {
        return .OriginLowerLeft
    }
}

/// Extension providing information about a given coordinate system type
public extension CoordinateSystem {
    /// The direction that a incremental vertical value will lead in in the coordinate system
    public var incrementalVerticalDirection: Direction.FourWay {
        switch self {
        case .OriginUpperLeft:
            return .Down
        case .OriginLowerLeft:
            return .Up
        }
    }
}
