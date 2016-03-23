import UIKit
    
/// Perform a closure of animations with a certain duration, optionally attaching a completion handler
public func Animate(animations: () -> Void, duration: NSTimeInterval = 0.3, onCompletion: (() -> Void)? = nil) {
    UIView.animateWithDuration(duration, animations: animations) { didComplete -> Void in
        onCompletion?()
    }
}
