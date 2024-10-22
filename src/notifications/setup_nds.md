# Setting up an NDS

Receiving push notifications involves using an Notification Delivery Service (NDS) as an intermediary to receive the webhook event from one of the SDK services. These can be currently one of several services that provide information about events that the Breez SDK registers for. For example, payment events from the LSP or swap transaction confirmation events from the chain service. The NDS then processes this information and dispatches a push notification to the intended mobile device, ensuring the user receives timely updates about incoming events. This architecture necessitates developers set up and maintain their own NDS, tailored to handle and forward these notifications efficiently. An example payload when a `payment_received` POST request to the webhook URL contains the following JSON formatted structure:

```json
{
    "template": "payment_received",
    "data": {  
        "payment_hash": "..." // The payment hash that is in progress
    }
}
```

The need to run your own NDS is because it's configured to send push notifications to your application users and therefore should be configured with the required keys and certificates. You can use our [reference NDS implementation](https://github.com/breez/notify) as a starting point or as is. Our implementation of the NDS expects URLs in the following format:
```
https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>
```
  


This is the same format used when [registering a webhook](using_webhooks.md) in the Breez SDK, replacing the `<PUSH_TOKEN>` with the mobile push token. Once the NDS has received such request it will send a push notification to the corresponding device.

## Mobile push token
Ensure that your mobile application is set up to receive push notifications and can generate a push token. This token uniquely identifies the device for push notifications.
* For iOS, use [Apple Push Notification Service (APNs)](https://developer.apple.com/documentation/usernotifications/registering_your_app_with_apns) to get the token.
* For Android, use [Firebase Cloud Messaging (FCM)](https://firebase.google.com/docs/cloud-messaging/manage-tokens) to obtain the token.
