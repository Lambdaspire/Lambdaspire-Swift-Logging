
import LambdaspireAbstractions

// NOTE: Just here for back-compat.

public class PrintLogger : StandardLogger {
    public init() {
        super.init(destinations: [PrintLogDestination()])
    }
}
