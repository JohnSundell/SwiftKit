import Foundation

/// Class that can be used for event-driven logic
public class Event<T> {
    private var observationHandlers: [ObjectIdentifier : T -> Void]
    
    /// Create a new instance of Event
    public init() {
        self.observationHandlers = [:]
    }
    
    /// Add an observer to the event with a handler that will be run once the event is triggered
    public func addObserver(observer: AnyObject, withHandler handler: T -> Void) {
        self.observationHandlers[ObjectIdentifier(observer)] = handler
    }
    
    /// Remove an observer from the event
    public func removeObserver(observer: AnyObject) {
        self.observationHandlers[ObjectIdentifier(observer)] = nil
    }
    
    /// Trigger the event with a value
    public func triggerWithValue(value: T) {
        for handler in self.observationHandlers.values {
            handler(value)
        }
    }
    
    /// Trigger the event (alias for triggerWithValue, syntactic sugar for Void events)
    public func trigger(value: T) {
        self.triggerWithValue(value)
    }
}
