import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(HJDeviceIdentityTests.allTests),
    ]
}
#endif
