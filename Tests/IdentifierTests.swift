import Foundation
import XCTest
import SwiftKit
import Unbox

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
    
    func testUnboxSupport() {
        let identifier = Identifier()
        
        let dictionary = [
            "identifier" : identifier.identifierString
        ]
        
        struct IdentifierContainer: Unboxable {
            let identifier: Identifier
            
            init(identifier: Identifier) {
                self.identifier = identifier
            }
            
            init(unboxer: Unboxer) {
                self.identifier = unboxer.unbox("identifier")
            }
        }
        
        let identifierContainer = IdentifierContainer(identifier: identifier)
        let unboxedIdentifierContainer: IdentifierContainer? = Unbox(dictionary)
        
        XCTAssertTrue(identifierContainer.identifier == unboxedIdentifierContainer?.identifier, "Could not unbox an identifier")
    }
}
