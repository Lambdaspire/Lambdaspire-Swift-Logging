
import LambdaspireAbstractions

import XCTest
@testable import LambdaspireLogging

final class LambdaspireLoggingTests: XCTestCase {
    func testPrintLogger() throws {
        
        let args: TestArgs = .init(a: "Hello", b: TestArgs(a: 123, b: TestArgs(a: TestArgs(a: 456, b: false), b: "Goodbye")))
        
        let logger: Logger = PrintLogger()
        
        logger.debug("✅ Debug Message.")
        logger.debug("✅ Debug Format.", args)
        
        logger.info("✅ Info Message.")
        logger.info("✅ Info Format.", args)
        
        logger.warning("✅ Warning Message.")
        logger.warning("✅ Warning Format.", args)
        
        logger.error("✅ Error Message.")
        logger.error("✅ Error Format.", args)
        logger.error(TestError(ohNo: "Oh yes"), "✅ Error Format.", args)
        
        logger.warning("✅ Structured log {a} {b.b.b}", args)
        logger.warning("✅ Structured log {A.b.b.b} {B}", (
            A: args,
            B: "Test"
        ))
        
        logger.error(TestError(ohNo: "Structured Error"), "Structured Log {A.b.c} {B.c.d}", (
            A: (b: (c: "✅ A.b.c", unused: ""), unused: ""),
            B: (c: (d: "✅ B.c.d", unused: ""), unused: "")
        ))
        
        logger.info("✅ Dictionary test {A} {B} {1} {2} {Complex}", [
            "A": "Aye",
            "B": "Bee",
            1: "One",
            2: 222,
            "Complex": TestArgs(a: "Not really supported", b: "Sorry")
        ])
    }
}

struct TestArgs<A, B> {
    var a: A
    var b: B
}

struct TestError : Error {
    var ohNo: String
}
