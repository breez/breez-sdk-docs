# Receiving Payment Notifications via Webhook in Breez SDK

## Overview
The Breez SDK provides a robust feature for applications to receive real-time notifications for incoming payments over the Lightning Network. This is achieved through the use of webhooks. A webhook is a powerful tool that allows your application to be notified via a specified URL when a payment is received.

## Setting Up the Webhook
To utilize this feature, you need to set up a webhook that Breez can call when a payment is received.

## Step 1: Define Your Webhook URL
First, you need to define the URL endpoint in your application that will handle incoming payment notifications. This URL should be capable of receiving POST requests.

## Step 2: Register the Webhook with Breez
Next, register this URL with the Breez SDK. This step involves calling a specific SDK function.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/webhook.rs:register-webook}}
```
</section>
</custom-tabs>

## Handling Incoming Notifications
When a payment is received, Breez will send a POST request to your webhook URL. The request body will contain details about the payment.

### Expected Webhook Payload
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

## Processing the Payload
Processing the Payload is according to the application needs. One of the major use cases that can be handled via webhooks is receiving a payment in mobile app while the app is not running, or in short "offline receive"

## Webhook integration for "offline recieve"
In the context of mobile applications using the Breez SDK for Lightning Network payments, a crucial architectural component involves the seamless flow of payment notifications to the user's mobile device. This process is facilitated through a Notification Delivery Service (NDS), acting as an intermediary. When a payment is made to a user, the LSP sends a notification to the NDS, configured with a specific webhook URL. The NDS then processes this information and dispatches a push notification to the intended mobile device, ensuring the user receives timely updates about incoming payments. This architecture necessitates vendors to set up and maintain their own NDS, tailored to handle and forward these notifications efficiently.

## Step 1: Run your own NDS
As written above you will need to run your own NDS because NDS is configured to send push notifications to your app users, therefore configured with the required keys and certificates.
If you don't want to write it from scratch you can use our running <a href="https://github.com/breez/notify">NDS</a>

Our used NDS expects urls in the following format:
<section><i>https://your-nds-service.com/notify?platform=<ios|android>&token=[PUSH_TOKEN]</i></section>

Once the NDS received such request it will send a push notification to the matched device.

## Step 2: Obtain a mobile push token
First, ensure that your mobile application is set up to receive push notifications and can generate a push token. This token uniquely identifies the device for push notifications.

* For iOS, use Apple Push Notification Service (APNs) to get the token.
* For Android, use Firebase Cloud Messaging (FCM) to obtain the token.

## Step 3: Register the Webhook with Breez
Register the constructed URL with the Breez SDK By calling an SDK function.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/webhook.rs:register-payment-webook}}
```
</section>
</custom-tabs>

## Step 4: Handling Notifications When the App is Not Running
To ensure that your mobile application can handle payment notifications even when it is not actively running, specific implementations are required for both iOS and Android platforms. This involves waking up the app upon receiving a push notification, connecting with the Breez SDK, and then waiting for the payment to be fully received.

### iOS Implementation Using NotificationServiceExtension

#### Overview
For iOS, the app must use NotificationServiceExtension to process notifications in the background.

#### Steps for Implementation
* Integrate NotificationServiceExtension: Add NotificationServiceExtension to your iOS project. This extension allows your app to process the incoming push notification data in the background before presenting it to the user.

* Wake Up the App: When a push notification is received, the NotificationServiceExtension will be triggered, waking up the app.

* Connect with Breez SDK: Inside the extension, implement the logic to establish a connection with the Breez SDK which also runs the signer so the payment can be processed.

* Wait for Payment Completion: Once connected, the app should wait for completion status from the Breez SDK that the payment has been received.

* Handle the Notification: After confirming the payment, handle the notification accordingly by updating the app's UI.

As a reference implelentation see how we did it in c-breez wallet: <a href="https://github.com/breez/c-breez/blob/main/ios/Breez%20Notification%20Service%20Extension/NotificationService.swift">NotificationService.swift</a>

### Android Implementation Using WorkManager

#### Overview
On Android, WorkManager is used to perform background tasks when the app is not active.

#### Steps for Implementation

* Integrate WorkManager: Add WorkManager to your Android project. This component allows the app to handle background tasks efficiently.

* Wake Up the App: Configure WorkManager to trigger a background task when a push notification for a payment is received.

* Connect with Breez SDK: In the background task, implement logic to establish a connection with the Breez SDK.

* Wait for Payment Completion: Once connected, the app should wait for completion status from the Breez SDK that the payment has been received.

* Handle the Notification: After confirming the payment, handle the notification accordingly by updating the app's UI.

## Conclusion
Implementing these mechanisms on both iOS and Android ensures that your application remains responsive to payment notifications via the Breez SDK, even when it is not running in the foreground.