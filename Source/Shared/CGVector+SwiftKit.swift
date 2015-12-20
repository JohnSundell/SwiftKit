import CoreGraphics

/// SwiftKit extensions to CGVector
public extension CGVector {
    /// The linear distance value that is the result value of the vector
    public var linearValue: CGFloat {
        return sqrt(pow(self.dx, 2) + pow(self.dy, 2))
    }
    
    /// The primary direction that the vector is facing in a coordinate system
    public func primaryDirectionInCoordinateSystem(coordinateSystem: CoordinateSystem) -> Direction.FourWay {
        if self.dx > self.dy {
            if self.dx > 0 {
                return .Left
            }
            
            return .Right
        }
        
        let incrementalVerticalDirection = coordinateSystem.incrementalVerticalDirection
        
        if self.dy > 0 {
            return incrementalVerticalDirection
        }
        
        return incrementalVerticalDirection.oppositeDirection()
    }
}
