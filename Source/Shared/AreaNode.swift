import SpriteKit

/// A SpriteKit node that defines a logical area
public class AreaNode: SKNode {
    /// The size of the node's area
    public var areaSize: CGSize
    /// The rectangle that makes up the node's area, in the node's parent coordinate system
    public var areaRect: CGRect { return CGRect(origin: self.position, size: self.areaSize) }
    
    /// Initialize an instance of this node with an area size
    public init(areaSize: CGSize) {
        self.areaSize = areaSize
        super.init()
    }

    public required init?(coder aDecoder: NSCoder) {
        self.areaSize = CGSize()
        super.init()
    }
}
