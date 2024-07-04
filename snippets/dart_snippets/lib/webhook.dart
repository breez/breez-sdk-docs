import 'package:dart_snippets/sdk_instance.dart';

Future<void> registerWebhook() async {
  // ANCHOR: register-webook
  await breezSDK.registerWebhook(webhookUrl: "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>");
  // ANCHOR_END: register-webook
}

Future<void> unregisterWebhook() async {
  // ANCHOR: unregister-webook
  await breezSDK.unregisterWebhook(webhookUrl: "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>");
  // ANCHOR_END: unregister-webook
}
