import XCTest

class RiceCookerTests: XCTestCase {
    func testShowMenu() {
        let riceCooker = RiceCooker(inputStream: MockInputStream())
        let expectation = XCTestExpectation(description: "Show menu")

        riceCooker.showMenu {
            XCTAssertTrue(riceCooker.output.contains("Welcome to the Rice Cooker!"))
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    func testCookRice() {
        let riceCooker = RiceCooker(inputStream: MockInputStream())
        let expectation = XCTestExpectation(description: "Cook rice")

        riceCooker.cookRice {
            XCTAssertTrue(riceCooker.output.contains("Rice is cooked!"))
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 10.0)
    }

    class MockInputStream: InputStream {
        override func read(_ buffer: UnsafeMutablePointer<UInt8>, maxLength len: Int) -> Int {
            buffer.pointee = UInt8(UnicodeScalar("1").value)
            return 1
        }
    }
}

let tests = RiceCookerTests()
tests.testShowMenu()
tests.testCookRice()
