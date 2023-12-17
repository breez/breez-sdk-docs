# Receiving payments via  mobile notifications 

## Overview
The Breez SDK provides users the ability to receive Lightning payments via mobile notifications. It uses a webhook that allows your application to be notified (via a pre-specified URL) when a payment is about to be received.

## Setting up a webhook
To use this feature, you need to set up a webhook that an LSP can call when a payment is received.

### Step 1: Define your webhook URL
Firstly, you need to define the URL endpoint in your application that will handle incoming payment notifications. This URL should be capable of receiving POST requests.

### Step 2: Register your Webhook
Next, register this URL with the Breez SDK. This step involves calling the register-webook API as follows:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/webhook.rs:register-webook}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/Webhook.swift:register-webook}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/Webhook.kt:register-webook}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/webhook.ts:register-webook}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/webhook.dart:register-webook}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/webhook.py:register-webook}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/webhook.go:register-webook}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/Webhook.cs:register-webook}}
```
</section>

</custom-tabs>

## Handling incoming notifications
When a payment is received, the LSP will send a POST request to your webhook URL. The request body will contain details about the payment.

### Expected webhook payload
The payment received webhook payload is json formatted and contains the following structure:

<section>
<pre>
{
 "type": "payment_received",
 "data": {  
  "payment_hash" : [payment hash]
 }
}
</pre>
</section>

## Webhook integration for receiving payments while the app isn't running 
You can use this webhook to allow mobile users to receive Lightning payments even if they aren't running the app at the time of the payment. This process involves using a Notification Delivery Service (NDS) acting as an intermediary. When a payment is made to a user, the LSP sends a notification to the NDS configured with a specific webhook URL. The NDS then processes this information and dispatches a push notification to the intended mobile device, ensuring the user receives timely updates about incoming payments. This architecture necessitates vendors setting up and maintaining their own NDS, tailored to handle and forward these notifications efficiently.

### Step 1: Run your own NDS
You will need to run your own NDS because the NDS is configured to send push notifications to your app users, therefore configured with the required keys and certificates.

You can use our [reference NDS implementation](https://github.com/breez/notify).

Our NDS implementation expects URLs in the following format:
<section><i>https://your-nds-service.com/notify?platform=<ios|android>&token=[PUSH_TOKEN]</i></section>

Once the NDS has received such request it will send a push notification to the corresponding devices.

### Step 2: Obtain a mobile push token
Ensure that your mobile application is set up to receive push notifications and can generate a push token. This token uniquely identifies the device for push notifications.

* For iOS, use Apple Push Notification Service (APNs) to get the token.
* For Android, use Firebase Cloud Messaging (FCM) to obtain the token.

### Step 3: Register a webhook
Register the constructed URL with the Breez SDK By calling the register-payment-webook API as follows:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/webhook.rs:register-payment-webook}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/Webhook.swift:register-payment-webook}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/Webhook.kt:register-payment-webook}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/webhook.ts:register-payment-webook}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/webhook.dart:register-payment-webook}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/webhook.py:register-payment-webook}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/webhook.go:register-payment-webook}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/Webhook.cs:register-payment-webook}}
```
</section>

</custom-tabs>

## Step 4: Handling notifications when the app isn't running
To ensure that your mobile application can handle payment notifications even when it is not actively running, specific implementations are required for both iOS and Android platforms. This involves waking up the app upon receiving a push notification, connecting with the Breez SDK, and then waiting for the payment to be fully received.

### iOS: using NotificationServiceExtension

#### Overview
For iOS, the app must use NotificationServiceExtension to process notifications in the background.

#### Implementation
* Integrate NotificationServiceExtension: add NotificationServiceExtension to your iOS project. This extension allows your app to process the incoming push notification data in the background before presenting it to the user.

* Wake-up the app: when a push notification is received, the NotificationServiceExtension will be triggered, waking up the app.

* Connect with Breez SDK: in the extension, establish a connection with the Breez SDK to process the incoming payment.

* Wait for payment completion: once connected, the app should wait for completion status from the Breez SDK that the payment has been received.

* Display a notification: after confirming the payment, display a notification.

For a complete reference, see how we implemented it in c-breez wallet: [NotificationService.swift](https://github.com/breez/c-breez/blob/main/ios/Breez%20Notification%20Service%20Extension/NotificationService.swift).

### Android: using WorkManager

#### Overview
On Android, WorkManager is used to perform background tasks when the app is not active.

#### Implementation

* Integrate WorkManager: add WorkManager to your Android project. This component allows the app to handle background tasks efficiently.

* Wake-up the app: configure WorkManager to trigger a background task when a push notification for a payment is received.

* Connect with Breez SDK: in the background task, establish a connection with the Breez SDK to process the incoming payment.
  
* Wait for payment completion: once connected, the app should wait for completion status from the Breez SDK that the payment has been received.

* Display a notification: after confirming the payment, display a notification.
