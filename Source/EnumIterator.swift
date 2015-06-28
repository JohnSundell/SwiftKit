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
public class EnumIterator<T: RawRepresentable where T.RawValue: Number> {
    /**
     *   Iterate through each member of the enum that this class is for, and execute a closure for each one
     *
     *   @param forEachCase A closure to execute on each member of the enum. The parameter sent to the
     *   closure will be the current member.
     */
    public class func iterate(forEachCase: T -> Void) {
        self.iterateWithSequenceOverride({ Int in
            return nil
        }, forEachCase: forEachCase)
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
     *  closure will be the current member.
     */
    public class func iterateWithSequenceOverride(sequenceOverride: T.RawValue -> T?, forEachCase: T -> Void) {
        var currentRawValue = T.RawValue(0)
        
        while true {
            if let enumCase = sequenceOverride(currentRawValue) {
                forEachCase(enumCase)
                currentRawValue = enumCase.rawValue + T.RawValue(0)
                continue
            } else if let enumCase = T(rawValue: currentRawValue) {
                forEachCase(enumCase)
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
    public class func map<M>(forEachCase: T -> M) -> [M] {
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
    public class func map<M>(forEachCase: T -> M) -> [T : M] {
        var mapped = [T : M]()
        
        self.iterate() {
            mapped[$0] = forEachCase($0)
        }
        
        return mapped
    }
}