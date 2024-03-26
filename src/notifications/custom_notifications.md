# Custom Notification Handling

You can customise the Notification Plugin even further by handling your own notification types sent to the application via push notification. Follow the code example below for adding these to iOS and Android.

<custom-tabs category="lang">
<div slot="title">Swift</div>
<section>

```swift,ignore
class NotificationService: SDKNotificationService {
    // Override the `getTaskFromNotification` function 
    override func getTaskFromNotification() -> TaskProtocol? { 
        if let task = super.getTaskFromNotification() {
            // Return the task if it can already be handled by the notification plugin
            return task
        }

        guard let content = bestAttemptContent else { return nil }
        guard let notificationType = content.userInfo[Constants.MESSAGE_DATA_TYPE] as? String else { return nil }
        guard let payload = content.userInfo[Constants.MESSAGE_DATA_PAYLOAD] as? String else { return nil }
        
        switch(notificationType) {
        case "custom_type":
            return CustomTask(payload: payload, logger: self.logger, contentHandler: contentHandler, bestAttemptContent: bestAttemptContent)
        default:
            return nil
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


You can customise the Notification Plugin even further by handling your own notification types sent to the application via push notification. Follow the code example below for adding these to iOS and Android.

<custom-tabs category="lang">
<div slot="title">Swift</div>
<section>

```swift,ignore
import UserNotifications
import Foundation

// Use a codeable struct to decode the notification payload
struct CustomRequest: Codable {
}

class CustomTask : TaskProtocol {
    fileprivate let TAG = "CustomTask"
    
    internal var payload: String
    internal var contentHandler: ((UNNotificationContent) -> Void)?
    internal var bestAttemptContent: UNMutableNotificationContent?
    internal var logger: ServiceLogger
    internal var receivedPayment: Payment? = nil
    
    init(payload: String, logger: ServiceLogger, contentHandler: ((UNNotificationContent) -> Void)? = nil, bestAttemptContent: UNMutableNotificationContent? = nil) {
        self.payload = payload
        self.contentHandler = contentHandler
        self.bestAttemptContent = bestAttemptContent
        self.logger = logger
    }
    
    // Use the `onEvent` function to handle events from the Breez SDK 
    // that can be used in your task
    public func onEvent(e: BreezEvent) {}
    
    // The `start` function is called once the SDK instance is connected
    func start(breezSDK: BlockingBreezServices) throws {
        var customRequest: CustomRequest? = nil
        do {
            customRequest = try JSONDecoder().decode(CustomRequest.self, from: self.payload.data(using: .utf8)!)
        } catch let e {
            self.logger.log(tag: TAG, line: "failed to decode payload: \(e)", level: "ERROR")
            self.onShutdown()
            throw e
        }

        do {
            // Do something with the SDK, then once finished call 'displayPushNotification' with a success 
            // or failure message. The 'onShutdown' function can also be called to show the failure message
            self.displayPushNotification(title: "Success", logger: self.logger)
        } catch let e {
            self.logger.log(tag: TAG, line: "Failed to process notification: \(e)", level: "ERROR")
            self.onShutdown()
        }
    }

    // The 'onShutdown' function can be called when the notification service extension is about to be 
    // shutdown by the OS, here you can cleanup and display the failed push notification message
    func onShutdown() {
        self.displayPushNotification(title: "Failed", logger: self.logger)
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

