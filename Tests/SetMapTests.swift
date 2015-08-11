import XCTest

class SetMapTests: XCTestCase {
    func testInsertionAndRemoval() {
        var setMap = SetMap<Int, String>()
        
        let key = 15
        
        let string1 = "string1"
        let string2 = "string2"
        
        setMap.insertValue(string1, forKey: key)
        setMap.insertValue(string2, forKey: key)
        
        XCTAssertTrue(setMap.valuesForKey(key)!.count == 2)
        XCTAssertTrue(setMap.valuesForKey(key)!.contains(string1))
        XCTAssertTrue(setMap.valuesForKey(key)!.contains(string2))
        
        let removedString = setMap.removeValue(string2, forKey: key)
        
        XCTAssertTrue(removedString == string2)
        XCTAssertTrue(setMap.valuesForKey(key)!.count == 1)
        XCTAssertFalse(setMap.valuesForKey(key)!.contains(string2))
        
        let removedNonExistingString = setMap.removeValue(string2, forKey: key)
        
        XCTAssertNil(removedNonExistingString)
        XCTAssertTrue(setMap.valuesForKey(key)!.count == 1)
        XCTAssertFalse(setMap.valuesForKey(key)!.contains(string2))
    }
}
