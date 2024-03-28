# Introduction

The Breez SDK Notification Plugin provides vendors the ability to receive events via mobile notifications even while the application is in the background or closed. This plugin processes several different notification types like receiving payments, LNURL-pay flows and swap confirmations. You can even extend the functionality to handle your own notification types within your application.

![receive via notifications_2](https://github.com/breez/breez-sdk-docs/assets/31890660/75e7cac6-4480-453d-823b-f52bd6757ce9)

## How it works

This process involves using a Notification Delivery Service (NDS) acting as an intermediary host by the application developer. The NDS must provide a public facing webhook URL where a POST request can be sent to when a notification needs to be delivered to the application. The NDS then forwards the data sent in the webhook POST request via push notification to the application. When the application then receives the push notification then Breez SDK Notification Plugin can be used to process the event.

## Next Steps
- **[Setup an NDS](setup_nds.md)** to receive webhook requests
- **[Register a webhook](register_webhook.md)** in your main application
- **[Project integration](setup_plugin.md)** using a notification service extension or foreground service
