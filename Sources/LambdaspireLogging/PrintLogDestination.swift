
public class PrintLogDestination : LogDestination {
    
    public func log<A>(level: LogLevel, message: String, error: (any Error)?, args: A) {
        print("""
        
        LOG
        - LEVEL: \(level)
        - MESSAGE: \(message)
        - ERROR: \(error == nil ? "None" : "\(error!)")
        - ARGS: \(args)
        
        """)
    }
}
