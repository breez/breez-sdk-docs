# Notification Integration

The Notification Plugin is designed to be used when the application isn't running. For this to be acheived reliably and to ensure that the notification is processed, specific implementations are required for both Android and iOS platforms to handle the incoming push notifications.

* For Android, the application requires a [Foreground Service](android_setup.md) to handle the notification intent.

* For iOS, the application requires a [Notification Service Extension](ios_setup.md) to handle the notification request.
