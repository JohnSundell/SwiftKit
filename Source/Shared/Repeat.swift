import Foundation

/**
 *  Repeat a closure n number of times
 *
 *  @param numberOfTimes The number of times to repeat the closure
 *  @param closure The closure to repeat
 */
public func Repeat(numberOfTimes: Int, closure: () -> Void) {
    for _ in 0..<numberOfTimes {
        closure()
    }
}

/// Repeat a closure n number of times, with the current index as a closure argument
public func RepeatWithIndex(numberOfTimes: Int, closure: Int -> Void) {
    for i in 0..<numberOfTimes {
        closure(i)
    }
}