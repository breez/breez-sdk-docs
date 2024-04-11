# Logging

You can override the default logger used by the Notification Plugin to use your own logging implementation or dependency. Lets look at an example of a file logger.

<custom-tabs category="lang">
<div slot="title">Swift</div>
<section>
In iOS lets use the <code>XCGLogger</code> to handle logging to a seperate log file in the app group's shared directory.

```swift,ignore
import BreezSDK
import XCGLogger

fileprivate let appGroup = "group.com.example.application"

class NotificationService: SDKNotificationService {
    // Override the `init` function 
    override init() {
        // Initialize XCGLogger
        let logsDir = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup)!.appendingPathComponent("logs")
        let extensionLogFile = logsDir.appendingPathComponent("\(Date().timeIntervalSince1970).ios-extension.log")
        
        xcgLogger = {
            let log = XCGLogger.default
            log.setup(level: .info, showThreadName: true, showLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: extensionLogFile.path)
            return log
            
        }()
        
        super.init()
        // Set notification plugin logger that utilizes the XCGLogger library
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
In Android lets use the <code>tinylog</code> to handle logging to a file. First create a utility class to configure tinylog.

```kotlin,ignore
package com.example.application

import android.content.Context
import java.io.File
import org.tinylog.kotlin.Logger

class LogHelper {
    companion object {
        private const val TAG = "LogHelper"
        private var isInit: Boolean? = null

        internal fun configureLogger(applicationContext: Context): Boolean? {
            synchronized(this) {
                // Get `/logs` folder from app data directory
                val loggingDir =
                    File(applicationContext.applicationInfo.dataDir, "/logs").apply {
                        mkdirs()
                    }

                System.setProperty("tinylog.directory", loggingDir.absolutePath)
                System.setProperty("tinylog.timestamp", System.currentTimeMillis().toString())

                if (isInit == false) {
                    Logger.tag(TAG).debug { "Starting ${BuildConfig.APPLICATION_ID}..." }
                    Logger.tag(TAG).debug { "Logs directory: '$loggingDir'" }
                    isInit = true
                }
                return isInit
            }
        }
    }
}
```

When a message is received by the messaging service, configure the logger.

```kotlin,ignore
package com.example.application

import breez_sdk_notification.MessagingService
import com.example.application.LogHelper.Companion.configureLogger
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage

class ExampleFcmService : MessagingService, FirebaseMessagingService() {
    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        super.onMessageReceived(remoteMessage)
        // Initialise the logger
        configureLogger(applicationContext)
        Logger.tag(TAG).debug { "FCM message received!" }

        // Go on to call `startServiceIfNeeded`
    }
}
```

When the foreground service is created, initialise the Breek SDK log stream and subscribe to log entries

```kotlin,ignore
package com.example.application

import breez_sdk.setLogStream
import breez_sdk_notification.ForegroundService
import breez_sdk_notification.NotificationHelper.Companion.registerNotificationChannels
import org.tinylog.kotlin.Logger

class ExampleForegroundService : ForegroundService() {
    // Override the `onCreate` function
    override fun onCreate() {
        super.onCreate()
        registerNotificationChannels(applicationContext, DEFAULT_CLICK_ACTION)
        // Set notification plugin logger that utilizes the tinylog library
        val logger = CustomLogListener()
        setLogger(logger)
        // Use the same logger to listen in on BreezSDK logs
        try {
            setLogStream(logger)
        } catch (e: Exception) {
            Logger.tag(TAG).error { "Failed to set log stream: ${e.message}" }
        }
    }
}
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
package com.example.application

import breez_sdk.LogEntry
import breez_sdk.LogStream
import org.tinylog.kotlin.Logger

class CustomLogListener : LogStream {
    override fun log(l: LogEntry) {
        when (l.level) {
            "ERROR" -> Logger.tag(TAG).error { l.line }
            "WARN" -> Logger.tag(TAG).warn { l.line }
            "INFO" -> Logger.tag(TAG).info { l.line }
            "DEBUG" -> Logger.tag(TAG).debug { l.line }
            "TRACE" -> Logger.tag(TAG).trace { l.line }
        }
    }
}
```

</section>
</custom-tabs>

