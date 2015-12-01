import Foundation
import SpriteKit

/// SwiftKit extensions to NSAttributedString
public extension NSAttributedString {
    /// Create a new attributed string with the most common layout properties
    public convenience init(string: String, textColor: SKColor? = nil, font: Font? = nil, alignment: NSTextAlignment? = nil) {
        var attributes = [String : AnyObject]()
        attributes[NSForegroundColorAttributeName] = textColor
        attributes[NSFontAttributeName] = font
        
        if let alignment = alignment {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = alignment
            attributes[NSParagraphStyleAttributeName] = paragraphStyle
        }
        
        self.init(string: string, attributes: attributes)
    }
}
