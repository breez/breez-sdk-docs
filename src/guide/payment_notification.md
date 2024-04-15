# Implementing mobile notifications

The Breez SDK Notification Plugin provides developers a simple solution to improve the payment experience on a mobile device. No longer does the application need to be in foreground when receiving payments. When the Notification Plugin is added to process push notifications, the application can be in the background or even closed.

## How it works

The process involves using a Notification Delivery Service (NDS) acting as an intermediary host by the application developer. The NDS must provide a public facing webhook URL where a POST request can be sent to when a notification needs to be delivered to the application. The NDS then forwards the data sent in the webhook POST request via push notification to the application. When the application then receives the push notification, the Breez SDK Notification Plugin can be used to process the event.

![receive via notifications_2](https://github.com/breez/breez-sdk-docs/assets/31890660/75e7cac6-4480-453d-823b-f52bd6757ce9)

## Use cases

The Notification Plugin handles several use cases by default to automatically process push notifications sent via the NDS from when an SDK service calls the registered webhook. If your use case isn't covered by the Notification Plugin, you can extend the plugin to [handle custom notifications](/notifications/custom_notifications.md).

#### Receiving a payment

Payments are routed through an LSP to the user's node. When an LSP intercepts a payment, the LSP calls the registered webhook with the details of the payment. The Notification Plugin when receiving this notification from the NDS will connect to the Breez SDK and wait for the payment to be processed by the Breez SDK. The `payment_received` notification type has the following format:
```json
{
    "template": "payment_received",
    "data": {  
        "payment_hash": "" // The payment hash that is in progress
    }
}
```

#### Confirming a swap

When receiving a payment via a onchain address, the swap address needs to be monitored until the funds are confirmed onchain before the swap is executed. A chain service is used to monitor the address for confirmed funds. Once funds are confirmed, the chain service calls the registered webhook with the address. The Notification Plugin when receiving this notification from the NDS will connect to the Breez SDK and redeem the swap. The `address_txs_confirmed` notification type has the following format:
```json
{
    "template": "address_txs_confirmed",
    "data": {  
        "address": "" // The address of the swap with confirmed funds
    }
}
```

#### Handling LNURL pay requests

Having the ability to process push notifications when the application is in the background or closed also opens up the ability to handle payment requests from a static LNURL address. To do this the application also needs to register a webook with an [LNURL-pay service](lnurlpay.md), then when the LNURL service receives a request on the static LNURL address, it will forward it via the NDS to the application. The Notification Plugin handles the two-step flow for fulfilling these requests.

Firstly the LNURL service receives a request for LNURL-pay information to get the min/max amount that can be received. The LNURL service calls the registered webhook and when receiving this notification, the Notification Plugin will connect to the Breez SDK and send a response back to the LNURL service based on the node info. The `lnurlpay_info` notification type has the following format:
```json
{
    "template": "lnurlpay_info",
    "data": {  
        "callback_url": "", // The URL of the LNURL service
        "reply_url": "" // The URL to reply to this request
    }
}
```
Secondly the LNURL service receives a request for an invoice based on the selected amount to pay. The LNURL service calls the registered webhook and when receiving this notification, the Notification Plugin will connect to the Breez SDK and call receive payment for the requested amount. The resulting invoice is then returned to the LNURL service. The `lnurlpay_invoice` notification type has the following format:
```json
{
    "template": "lnurlpay_invoice",
    "data": {  
        "amount": 0, // The amount in millisatoshis within the min/max sendable range
        "reply_url": "" // The URL to reply to this request
    }
}
```

## Next steps
- **[Setting up an NDS](/notifications/setup_nds.md)** to receive webhook requests
- **[Registering a webhook](/notifications/register_webhook.md)** in your main application
- **[Integrating the plugin](/notifications/setup_plugin.md)** using a notification service extension or foreground service
