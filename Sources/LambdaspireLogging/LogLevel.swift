
public enum LogLevel : Int {
    case verbose = 1
    case debug = 2
    case info = 3
    case warn = 4
    case error = 5
}

extension LogLevel : Comparable {

    public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
