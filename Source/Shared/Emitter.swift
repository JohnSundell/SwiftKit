import Foundation

/// Class that can be used to emit values to various subscribers
public class Emitter<T> {
    private var subscriptionHandlers: [ObjectIdentifier : T -> Void]
    
    /// Create a new instance
    public init() {
        self.subscriptionHandlers = [:]
    }
    
    /// Add an subscriber to the emitter with a handler that will be run once a value is emitted
    public func addSubscriber(subscriber: AnyObject, withHandler handler: T -> Void) {
        self.subscriptionHandlers[ObjectIdentifier(subscriber)] = handler
    }
    
    /// Remove a subscriber from the emitter
    public func removeSubscriber(subscriber: AnyObject) {
        self.subscriptionHandlers[ObjectIdentifier(subscriber)] = nil
    }
    
    /// Emit a value to this emitter's subscribers
    public func emit(value: T) {
        for handler in self.subscriptionHandlers.values {
            handler(value)
        }
    }
}
