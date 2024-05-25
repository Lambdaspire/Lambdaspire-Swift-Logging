
import LambdaspireAbstractions

import XCTest
@testable import LambdaspireLogging

final class LambdaspireLoggingTests: XCTestCase {
    func testPrintLogger() throws {
        
        let args: TestArgs = .init(a: "Hello", b: 69420)
        
        let logger: Logger = PrintLogger()
        
        logger.debug("Debug Message.")
        logger.debug("Debug Format.", args)
        
        logger.info("Info Message.")
        logger.info("Info Format.", args)
        
        logger.warning("Warning Message.")
        logger.warning("Warning Format.", args)
        
        logger.error("Error Message.")
        logger.error("Error Format.", args)
        logger.error(TestError(ohNo: "Oh yes"), "Error Format.", args)
    }
}

struct TestArgs {
    var a: String
    var b: Int
}

struct TestError : Error {
    var ohNo: String
}
