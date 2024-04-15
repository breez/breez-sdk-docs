# Configuring the plugin

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
package com.example.application

import android.content.SharedPreferences
import breez_sdk_notification.ForegroundService
import breez_sdk_notification.ServiceConfig
import org.tinylog.kotlin.Logger

class ExampleForegroundService : ForegroundService() {
    companion object {
        // Your own shared preferences name or `FlutterSharedPreferences` for Flutter
        private const val SHARED_PREFERENCES_NAME = "group.com.example.application"
        private const val CHANNEL_SETUP_FEE_LIMIT = "CHANNEL_SETUP_FEE_LIMIT"
    }

    // Override the `getServiceConfig` function 
    override fun getServiceConfig(): ServiceConfig? {
        try {
            val sharedPreferences: SharedPreferences = applicationContext.getSharedPreferences(
                SHARED_PREFERENCES_NAME,
                MODE_PRIVATE
            )
            // Get the fee limit for opening a new channel from the shared preferences
            val channelFeeLimitMsat =
                sharedPreferences.getLong(CHANNEL_SETUP_FEE_LIMIT, 0).toULong()
            return ServiceConfig(channelFeeLimitMsat = channelFeeLimitMsat)
        } catch (e: Exception) {
            Logger.tag(TAG).error { "Failed to get service config: ${e.message}" }
        }

        return ServiceConfig.default()
    }
}

```

</section>
</custom-tabs>
