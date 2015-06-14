#if os(iOS)

import UIKit

/// A button that executes a closure when tapped
public class ClosureButton: UIButton {
    private let closure: () -> Void
    
    public init(frame: CGRect, closure: () -> Void) {
        self.closure = closure
        super.init(frame: frame)
        self.addTarget(self, action: "executeClosure", forControlEvents: .TouchUpInside)
    }
    
    public convenience init(closure: () -> Void) {
        self.init(frame: CGRectZero, closure: closure)
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func executeClosure() {
        self.closure()
    }
}

#endif
