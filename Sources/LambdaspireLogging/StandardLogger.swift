
import LambdaspireAbstractions
import RegexBuilder

public class StandardLogger : Logger {
    
    private let minimumLogLevel: LogLevel
    private let destinations: [LogDestination]
    
    public init(minimumLogLevel: LogLevel = .verbose, destinations: [LogDestination]) {
        self.minimumLogLevel = minimumLogLevel
        self.destinations = destinations
    }
    
    public func info(_ message: String) {
        log(level: .info, format: message)
    }
    
    public func info<A>(_ format: String, _ args: A) {
        log(level: .info, format: format, args: args)
    }
    
    public func debug(_ message: String) {
        log(level: .debug, format: message)
    }
    
    public func debug<A>(_ format: String, _ args: A) {
        log(level: .debug, format: format, args: args)
    }
    
    public func warning(_ message: String) {
        log(level: .warn, format: message)
    }
    
    public func warning<A>(_ format: String, _ args: A) {
        log(level: .warn, format: format, args: args)
    }
    
    public func error(_ message: String) {
        log(level: .error, format: message)
    }
    
    public func error<A>(_ format: String, _ args: A) {
        log(level: .error, format: format, args: args)
    }
    
    public func error(_ error: any Error, _ message: String) {
        log(level: .error, format: message, error: error)
    }
    
    public func error<A>(_ error: any Error, _ format: String, _ args: A) {
        log(level: .error, format: format, error: error, args: args)
    }
    
    func log<A>(level: LogLevel, format: String, error: (any Error)? = nil, args: A = EmptyArgs()) {
        
        if let args = args as? Dictionary<AnyHashable, Any> {
            // TODO: Not quite.
            print(args.keys.map { "\($0)" } .joined(separator: ", "))
            
        } else {
            let m = Mirror(reflecting: args)
            let tokens = m.children.flatMap { unwrap($0.value, $0.label!) }
            let formatted = tokens
                .reduce(format) { acc, next in
                    acc.replacing(Regex {
                        "{"
                        next.keyPath
                        "}"
                    }) { m in
                        next.value
                    }
                }
            
            destinations.forEach { d in
                d.log(level: level, message: formatted, error: error, args: args)
            }
        }
    }

    func unwrap(_ value: Any, _ keyPath: String = "") -> [(keyPath: String, value: String)] {

        let m = Mirror(reflecting: value)

        if m.children.isEmpty {
            return [(keyPath,"\(value)")]
        } else {
            return m.children.flatMap { unwrap($0.value, "\(keyPath).\($0.label!)") }
        }
    }
}

struct EmptyArgs { }
