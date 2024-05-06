# Changing default strings

The Notification Plugin uses a set of identifiers and default strings to display messages when processing push notifications. These default strings can be customised by the application. For example, if you wanted to change the `lnurl_pay_metadata_plain_text`, which sets the LNURL-pay text/plain metadata.

## Android

In the `string.xml` file of the application's `res/values` directory, add the key/value:

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="lnurl_pay_metadata_plain_text">Pay to Custom App</string>
</resources>
```
You can find the current identifiers and default strings [here](https://github.com/breez/breez-sdk/blob/main/libs/sdk-bindings/bindings-android/lib/src/main/kotlin/breez_sdk_notification/Constants.kt)

## iOS

In the `Info.plist` file of the `NotificationService` target, add the key/value:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>lnurl_pay_metadata_plain_text</key>
	<string>Pay to Custom App</string>
</dict>
</plist>
```
You can find the current identifiers and default strings [here](https://github.com/breez/breez-sdk/blob/main/libs/sdk-bindings/bindings-swift/Sources/BreezSDKNotification/Constants.swift)