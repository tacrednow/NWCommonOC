import XCTest
@testable import NWCommonOC

final class NWCommonOCTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        // XCTAssertEqual(NWCommonOC().text, "Hello, World!")
        XCTAssertNotNil(NWCommonOC.getMacAddress())
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
