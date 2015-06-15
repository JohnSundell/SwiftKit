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
}
