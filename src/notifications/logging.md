# Logging

You can override the default logger used by the Notification Plugin to use your own logging implementation or dependency. Lets look at an example of a file logger.

<custom-tabs category="lang">
<div slot="title">Swift</div>
<section>

```swift,ignore
import BreezSDK
import XCGLogger

class NotificationService: SDKNotificationService {
    // Override the `init` function 
    override init() {
        // Initialize XCGLogger
        let logsDir = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: accessGroup)!.appendingPathComponent("logs")
        let extensionLogFile = logsDir.appendingPathComponent("\(Date().timeIntervalSince1970).ios-extension.log")
        
        xcgLogger = {
            let log = XCGLogger.default
            log.setup(level: .info, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: extensionLogFile.path)
            return log
            
        }()
        
        super.init()
        // Set NotificationService logger that utilizes the XCGLogger library
        let logger = CustomLogListener(logger: xcgLogger)
        setLogger(logger: logger)
        // Use the same logger to listen in on BreezSDK logs
        do {
            try setLogStream(logStream: logger)
        } catch let e {
            self.logger.log(tag: TAG, line:"Failed to set log stream: \(e)", level: "ERROR")
        }
    }
}
```

</section>
<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
```

</section>
</custom-tabs>

Implement a custom LogStream listener, this can be used to listen to log entries from both the Notification Plugin and Breez SDK.

<custom-tabs category="lang">
<div slot="title">Swift</div>
<section>

```swift,ignore
import XCGLogger

class CustomLogListener : LogStream {
    private var logger: XCGLogger
    
    init(logger: XCGLogger) {
        self.logger = logger
    }
    
    func log(l: LogEntry) {
        switch(l.level) {
        case "ERROR":
            logger.error { l.line }
            break
        case "WARN":
            logger.warning { l.line }
            break
        case "INFO":
            logger.info { l.line }
            break
        case "DEBUG":
            logger.debug { l.line }
            break
        case "TRACE":
            logger.verbose { l.line }
            break
        default:
            return
        }
    }
}
```

</section>
<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
```

</section>
</custom-tabs>

