
# Android: using foreground service
For Android, the app is required to use a foreground service to process reliably notifications in the background.

## Implementation steps
#### 1. Integrate foreground service
Add FirebaseMessagingService to your Android project. This service allows your app to process the incoming push notification. Then use the foreground service to process the notification in the background.
#### 2. Wake-up the app
When a push notification is received, the FirebaseMessagingService will be triggered, running the forground service.
#### 3. Connect with Breez SDK
In the foreground service, establish a connection with the Breez SDK to process the incoming payment.
#### 4. Wait for payment completion
Once connected, the app should wait for completion status from the Breez SDK that the payment has been received.
#### 5. Display a notification
After confirming the payment, display a notification.

## Reference implementation
For a complete reference, see how we implemented it in c-breez wallet: [BreezFcmService.kt](https://github.com/breez/c-breez/blob/main/android/app/src/main/kotlin/com/cBreez/client/BreezFcmService.kt).
