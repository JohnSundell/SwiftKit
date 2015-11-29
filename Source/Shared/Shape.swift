import Foundation
import SpriteKit

// MARK: - Public

/// Structure that acts as a high-level wrapper of Core Graphics' drawing APIs
public struct Shape {
    /// The color the lines of the shape should be stroked with
    public var strokeColor: SKColor
    /// The width of the shape's lines
    public var lineWidth: CGFloat
    /// The total size of the shape, in which all of its lines will fit
    public private(set) var size: CGSize
    /// The current point that the shape is being drawn at
    public private(set) var currentPoint: CGPoint
    
    private var drawingOperations: [ShapeDrawingOperation]
    
    /// Create a new instance of Shape, it won't have a stroke color and a 1 line width
    public init() {
        self.strokeColor = SKColor.clearColor()
        self.lineWidth = 1
        self.size = CGSize()
        self.drawingOperations = []
        self.currentPoint = CGPoint()
    }
    
    /// Move to a point in the shape (will set the `currentPoint` property)
    public mutating func moveToPoint(point: CGPoint) {
        self.currentPoint = point
    }
    
    /// Add a line from the current point to a target point
    public mutating func addLineToPoint(point: CGPoint) {
        if point.x > self.size.width {
            self.size.width = point.x
        }
        
        if point.y > self.size.height {
            self.size.height = point.y
        }
        
        self.appendDrawingOperation(.Line(from: self.currentPoint, to: point))
    }
    
    /// Add a line by moving a certain distance in the shape
    public mutating func addLineByMovingByX(deltaX: CGFloat, y deltaY: CGFloat) {
        let point = self.currentPoint.pointOffsetByX(deltaX, y: deltaY)
        self.addLineToPoint(point)
    }
    
    /// Close the shape, drawing a line to the origin point of the shape
    public mutating func close() {
        if let firstOperation = self.drawingOperations.first {
            self.addLineToPoint(firstOperation.originPoint)
        }
    }
    
    /// Generate a CGImage representation of the shape, using the size of the shape itself
    public func toCGImage() -> CGImageRef? {
        return self.toCGImageWithSize(self.size)
    }
    
    /// Generate a CGImage representation of the shape with a certain size. The shape will be scaled to fit the size.
    public func toCGImageWithSize(size: CGSize) -> CGImageRef? {
        let xScale = size.width / self.size.width
        let yScale = size.height / self.size.height
        
        let context = CGContext.bitmapContextWithSize(size)
        
        for operation in self.drawingOperations {
            switch operation {
            case .Line(let from, let to):
                CGContextMoveToPoint(context, from.x * xScale, from.y * yScale)
                CGContextAddLineToPoint(context, to.x * xScale, to.y * yScale)
            }
        }
        
        CGContextSetStrokeColorWithColor(context, self.strokeColor.CGColor)
        CGContextSetLineWidth(context, self.lineWidth)
        CGContextStrokePath(context)
        
        return CGBitmapContextCreateImage(context)
    }
    
    private mutating func appendDrawingOperation(operation: ShapeDrawingOperation) {
        self.drawingOperations.append(operation)
        self.currentPoint = operation.endPoint
    }
}

// MARK: - Private

private enum ShapeDrawingOperation {
    case Line(from: CGPoint, to: CGPoint)
}

extension ShapeDrawingOperation {
    var originPoint: CGPoint {
        switch self {
        case .Line(let from, _):
            return from
        }
    }
    
    var endPoint: CGPoint {
        switch self {
        case .Line(_, let to):
            return to
        }
    }
}
