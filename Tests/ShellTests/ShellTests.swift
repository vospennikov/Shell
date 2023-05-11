import XCTest
@testable import Shell

final class ShellTests: XCTestCase {
    let shell: Shell = .live
    
    func test_withoutArguments() throws {
        let uptime = try shell(.plainText("uptime"))
        XCTAssertTrue(uptime.contains("load average"))
    }
    
    func test_withInlineArguments() throws {
        let echo = try shell(.plainText("echo 'Hello world'"))
        XCTAssertEqual(echo, "Hello world")
    }
    
    func test_throwingError() {
        do {
            try shell(.plainText("cd /not_exist"))
            XCTFail("Expected expression to throw")
        } catch let error as Shell.Error {
            XCTAssertTrue(error.description.contains("no such file or directory"))
            XCTAssertTrue(error.stdOut.isEmpty)
            XCTAssertTrue(error.terminationStatus != 0)
        } catch {
            XCTFail("Invalid error type: \(error)")
        }
    }
}
