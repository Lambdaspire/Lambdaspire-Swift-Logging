
public protocol LogDestination {
    func log<A>(level: LogLevel, message: String, error: (any Error)?, args: A)
}
