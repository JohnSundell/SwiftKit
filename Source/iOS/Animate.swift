import UIKit
    
/// Perform a closure of animations with a certain duration, optionally attaching a completion handler
public func Animate(duration: NSTimeInterval, animations: () -> Void, onCompletion: (() -> Void)?) {
    UIView.animateWithDuration(duration, animations: animations) { didComplete -> Void in
        onCompletion?()
    }
}

/// Perform a closure of animations with a certain duration
public func Animate(duration: NSTimeInterval, animations: () -> Void) {
    Animate(duration, animations, nil)
}

/// Perform a closure of animations with a default 0.3 second duration, optionally attaching a completion handler
public func Animate(animations: () -> Void, onCompletion: (() -> Void)?) {
    Animate(0.3, animations, onCompletion)
}

/// Perform a closure of animations with a default 0.3 second duration
public func Animate(animations: () -> Void) {
    Animate(animations, nil)
}
