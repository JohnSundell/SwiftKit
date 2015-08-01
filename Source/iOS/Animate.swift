#if os(iOS)

import UIKit

/// Perform a closure of animations with a certain duration
public func Animate(duration: NSTimeInterval, animations: () -> Void) {
    UIView.animateWithDuration(duration, animations: animations)
}
 
/// Perform a closure of animations with a default 0.3 second duration
public func Animate(animations: () -> Void) {
    Animate(0.3, animations)
}

#endif
