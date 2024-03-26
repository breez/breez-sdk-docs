# Service Configuration

You can override the default Notification Plugin config to set values used to process certain notification events. For example, the `channelFeeLimitMsat` value can be set to limit the maximum fee paid in the case where a channel will be opened during receiving a payment with LNURL-pay.

<custom-tabs category="lang">
<div slot="title">Swift</div>
<section>

```swift,ignore
import BreezSDK

fileprivate let appGroup = "group.com.example.application"

class NotificationService: SDKNotificationService {
    private let channelSetupFeeLimit: String = "CHANNEL_SETUP_FEE_LIMIT"

    // Override the `getServiceConfig` function 
    override func getServiceConfig() -> ServiceConfig? {
        // Get the fee limit for opening a new channel from the `UserDefaults`
        let channelFeeLimitMsat = UInt64(UserDefaults(suiteName: appGroup)!.integer(forKey: channelSetupFeeLimit))
        return ServiceConfig.init(channelFeeLimitMsat: UInt64(channelFeeLimitMsat))
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
