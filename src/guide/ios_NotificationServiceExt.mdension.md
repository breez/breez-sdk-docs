
# iOS: using NotificationServiceExtension

## Overview
For iOS, the app must use NotificationServiceExtension to process notifications in the background.

## Implementation steps
### 1. Integrate NotificationServiceExtension
Add NotificationServiceExtension to your iOS project. This extension allows your app to process the incoming push notification data in the background before presenting it to the user.
### 2. Wake-up the app
When a push notification is received, the NotificationServiceExtension will be triggered, waking up the app.
### 3. Connect with Breez SDK
In the extension, establish a connection with the Breez SDK to process the incoming payment.
### 4. Wait for payment completion
Once connected, the app should wait for completion status from the Breez SDK that the payment has been received.
### 5. Display a notification
After confirming the payment, display a notification.

## Reference implementation
For a complete reference, see how we implemented it in c-breez wallet: [NotificationService.swift](https://github.com/breez/c-breez/blob/main/ios/Breez%20Notification%20Service%20Extension/NotificationService.swift).
