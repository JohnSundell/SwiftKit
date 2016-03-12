import XCTest
import SwiftKit

class RequireTests: XCTestCase {
    func testRequiringNonNilValue() {
        do {
            let required = try Require("String")
            XCTAssertEqual(required, "String")
        } catch {
            XCTFail("Shouldn't have thrown")
        }
    }
    
    func testRequiringNilValueThrows() {
        do {
            let nilString: String? = nil
            try Require(nilString)
            XCTFail("Should have thrown")
        } catch {
            XCTAssertNotNil((error as NSError).localizedDescription)
        }
    }
    
    func testRequiringAndCastingValidValue() {
        do {
            let string: Any = "String"
            let required: String = try RequireAndCast(string)
            XCTAssertEqual(required, "String")
        } catch {
            XCTFail("Shouldn't have thrown")
        }
    }
    
    func testRequiringAndCastingInvalidValueThrows() {
        do {
            let notAString: Any = 12
            try RequireAndCast(notAString) as String
            XCTFail("Should have thrown")
        } catch {
            XCTAssertNotNil((error as NSError).localizedDescription)
        }
    }
}