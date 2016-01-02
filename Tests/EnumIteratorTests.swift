import XCTest

private enum TestEnum: Int {
    case First
    case Second
    case Third
}

class EnumIteratorTests: XCTestCase {
    func testNext() {
        let iterator = EnumIterator<TestEnum>()
        XCTAssertEqual(iterator.next(), .First)
        XCTAssertEqual(iterator.next(), .Second)
        XCTAssertEqual(iterator.next(), .Third)
        XCTAssertNil(iterator.next())
    }
    
    func testStartValue() {
        let iterator = EnumIterator<TestEnum>(startValue: .Second)
        XCTAssertEqual(iterator.next(), .Second)
        XCTAssertEqual(iterator.next(), .Third)
    }
    
    func testForEach() {
        var handledValues = Set<TestEnum>()
        
        EnumIterator<TestEnum>.forEach({
            handledValues.insert($0)
        })
        
        XCTAssertEqual(handledValues.count, 3)
        XCTAssertTrue(handledValues.contains(.First))
        XCTAssertTrue(handledValues.contains(.Second))
        XCTAssertTrue(handledValues.contains(.Third))
    }
}