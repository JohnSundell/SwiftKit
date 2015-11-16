import Foundation

/// Typealias for closures that take Void input and produce Void output
public typealias VoidClosure = Void -> Void

/// Execute a closure on the Application's main queue (either sync or async)
public func OnMainQueue(closure: VoidClosure) {
    if NSThread.isMainThread() {
        closure()
    } else {
        dispatch_async(dispatch_get_main_queue(), closure)
    }
}

/// Delay a closure by n number of seconds (and perform it on the Application's main queue)
public func After(delay: NSTimeInterval, executeClosure closure: VoidClosure) {
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue(), closure)
}
