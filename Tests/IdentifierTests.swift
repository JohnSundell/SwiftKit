import Foundation
import XCTest

class IdentifierTests: XCTestCase {
    func testEquality() {
        let identiferA = Identifier()
        let identifierB = Identifier()
        
        XCTAssertFalse(identiferA == identifierB, "New identifiers should always be unique")
        
        let identifierC = identiferA
        
        XCTAssertTrue(identiferA == identifierC, "Identifiers should be value types")
    }
    
    func testInitWithIdentifierString() {
        let identifier = Identifier()
        let identifierFromString = Identifier(identifierString: identifier.identifierString)
        
        XCTAssertTrue(identifier == identifierFromString, "Identifier constructed from a string should be equal")
        
        let identifierFromInvalidString = Identifier(identifierString: "")
        
        XCTAssertTrue(identifierFromInvalidString == nil, "Should not be able to construct an identifier from an invalid string")
    }
}
