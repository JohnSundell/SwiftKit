import Foundation

/**
 *  Class for iterating through each member of an Int-based enum
 *
 *  Example usage:
 *
 *  EnumIterator<MyEnum>.iterate() {
 *      doSomething($0)
 *  }
 */
public class EnumIterator<T: RawRepresentable where T.RawValue: Number, T: Hashable> {
    /**
     *   Iterate through each member of the enum that this class is for, and execute a closure for each one
     *
     *   @param forEachCase A closure to execute on each member of the enum. The parameter sent to the
     *   closure will be the current member.
     */
    public class func iterate(@noescape forEachCase: T -> Void) {
        self.iterateWithSequenceOverride({ Int in
            return nil
        }, forEachCase: {
            forEachCase($0)
            return true
        })
    }
    
    /**
     *  Iterate through each member of the enum that this class is for, and execute a closure for each one,
     *  allowing the iteration to be cancelled at any time using a cancellation handler.
     *
     *  @param forEachCase A closure to execute on each member of the enum. The first parameter sent to the
     *  closure will be the current member, and the second will be a cancellation handler that can be called
     *  to cancel the iteration.
     */
    public class func iterateWithCancellationHandler(@noescape forEachCase: (T, Void -> Void) -> Void) {
        var iterationCancelled = false
        
        let cancellationHandler = {
            iterationCancelled = true
        }
        
        self.iterateWithSequenceOverride({ Int in
            return nil
        }, forEachCase: {
            forEachCase($0, cancellationHandler)
            return !iterationCancelled
        })
    }
    
    /**
     *  Iterate through each member of the enum that this class is for, and execute a closure for each one,
     *  optionally overriding which member is for which index. Only use this method for non-linear enums.
     *
     *  @param sequenceOverride A closure used to override which member is for which index. Return nil to
     *  continue the iteration in sequential order. You are required to use this to return members that
     *  do not have a raw value that is the incremented raw value of the previous member.
     *
     *  @param forEachCase A closure to execute on each member of the enum. The parameter sent to the
     *  closure will be the current member. The closure should return whether the iteration should continue or not.
     */
    public class func iterateWithSequenceOverride(@noescape sequenceOverride: T.RawValue -> T?, @noescape forEachCase: T -> Bool) {
        var currentRawValue = T.RawValue(0)
        var firstValueFound = false
        
        while true {
            if let enumCase = sequenceOverride(currentRawValue) {
                forEachCase(enumCase)
                currentRawValue = enumCase.rawValue + T.RawValue(0)
                firstValueFound = true
                
                continue
            } else if let enumCase = T(rawValue: currentRawValue) {
                forEachCase(enumCase)
                currentRawValue++
                firstValueFound = true
                
                continue
            } else if !firstValueFound {
                currentRawValue++
                
                continue
            }
            
            return
        }
    }
    
    /**
     *  Map an array of objects of type M from iterating through each member of the enum that this class is for,
     *  and executing a closure for each one
     *
     *  @param forEachCase A closure to execute on each member of the enum. The parameter sent to the
     *  closure will be the current member. The returned object will be appended to the mapped array.
     */
    public class func map<M>(@noescape forEachCase: T -> M) -> [M] {
        var mapped = [M]()
        
        self.iterate() {
            mapped.append(forEachCase($0))
        }
        
        return mapped
    }
    
    /**
     *  Map a dictionary of objects of type M, with one object mapped to one member of the enum that this class is for,
     *  by iterating through each member and executing a closure for each one
     *
     *  @param forEachCase A closure to execute on each member of the enum. The parameter sent to the
     *  closure will be the current member. The returned object will be added to the mapped dictionary.
     */
    public class func map<M>(@noescape forEachCase: T -> M) -> [T : M] {
        var mapped = [T : M]()
        
        self.iterate() {
            mapped[$0] = forEachCase($0)
        }
        
        return mapped
    }
}