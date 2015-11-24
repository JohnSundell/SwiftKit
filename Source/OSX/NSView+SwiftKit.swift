import Cocoa

/// SwiftKit extensions to Cocoa's NSView
public extension NSView {
    /// The view's background color, setting this to non-nil causes the view to become layer backed
    public var backgroundColor: NSColor? {
        get {
            guard let color = self.layer?.backgroundColor else {
                return nil
            }
            
            return NSColor(CGColor: color)
        }
        
        set {
            guard let color = newValue else {
                self.layer?.backgroundColor = NSColor.clearColor().CGColor
                return
            }
            
            self.wantsLayer = true
            self.layer?.backgroundColor = color.CGColor
        }
    }
}
