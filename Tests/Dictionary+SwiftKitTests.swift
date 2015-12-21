import XCTest

class DictionarySwiftKitTests: XCTestCase {
    func testNestedCollectionConvenienceAPIForArray() {
        var dictionary = [String : [Int]]()
        
        dictionary.insertValue(15, intoCollectionForKey: "key")
        XCTAssertEqual(["key" : [15]], dictionary)
        
        dictionary.removeValue(15, fromCollectionForKey: "key")
        XCTAssertEqual(["key" : []], dictionary)
    }
    
    func testNestedCollectionConvenienceAPIForSet() {
        var dictionary = [String : Set<Int>]()
        
        dictionary.insertValue(15, intoCollectionForKey: "key")
        XCTAssertEqual(["key" : [15]], dictionary)
        
        dictionary.removeValue(15, fromCollectionForKey: "key")
        XCTAssertEqual(["key" : []], dictionary)
    }
}