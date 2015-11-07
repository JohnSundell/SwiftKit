import Foundation

/// Structure acting as a namespace for enums describing axes
public struct Axis {
    /// An enum that describes an axis in a 2-dimensional coordinate system
    public enum TwoDimensional: Int {
        case X
        case Y
    }
    
    /// An enum that describes an axis in a 3-dimensional coordinate system
    public enum ThreeDimensional: Int {
        case X
        case Y
        case Z
    }
}
