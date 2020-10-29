import XCTest
@testable import HJDeviceIdentity

final class HJDeviceIdentityTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HJDeviceIdentity().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
