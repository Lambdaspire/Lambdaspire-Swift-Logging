
import LambdaspireAbstractions

public class PrintLogger : Logger {
    
    public init() { }
    
    public func info(_ message: String) {
        info(message, Empty())
    }
    
    public func info<A>(_ format: String, _ args: A) {
        log("ℹ️ Info", format, args)
    }
    
    public func debug(_ message: String) {
        debug(message, Empty())
    }
    
    public func debug<A>(_ format: String, _ args: A) {
        log("🐞 Debug", format, args)
    }
    
    public func warning(_ message: String) {
        warning(message, Empty())
    }
    
    public func warning<A>(_ format: String, _ args: A) {
        log("⚠️ Warning", format, args)
    }
    
    public func error(_ message: String) {
        error(EmptyError(), message, Empty())
    }
    
    public func error<A>(_ format: String, _ args: A) {
        error(EmptyError(), format, args)
    }
    
    public func error(_ error: any Error, _ message: String) {
        self.error(error, message, Empty())
    }
    
    public func error<A>(_ error: any Error, _ format: String, _ args: A) {
        // Don't look at me like that.
        if args is Empty {
            if error is EmptyError {
                print("❌ Error", format, separator: separator)
            } else {
                print("❌ Error", error, format, separator: separator)
            }
        } else {
            if error is EmptyError {
                print("❌ Error", format, args, separator: separator)
            } else {
                print("❌ Error", error, format, args, separator: separator)
            }
        }
    }
    
    private func log<A>(_ level: String, _ format: String, _ args: A) {
        if args is Empty {
            print(level, format, separator: separator)
        } else {
            print(level, format, args, separator: separator)
        }
    }
}

fileprivate struct Empty { }
fileprivate struct EmptyError : Error { }

fileprivate let separator = " -- "
