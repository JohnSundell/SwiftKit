import Foundation

/// Execute a closure on the Application's main queue (either sync or async)
public func OnMainQueue(closure: () -> Void) {
    if NSThread.isMainThread() {
        closure()
    } else {
        dispatch_async(dispatch_get_main_queue(), closure)
    }
}