import 'package:dart_snippets/sdk_instance.dart';

Future<void> registerWebhook() async {
  // ANCHOR: register-webook
  String url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>";
  await breezSDK.registerWebhook(webhookUrl: url);
  // ANCHOR_END: register-webook
}

Future<void> unregisterWebhook() async {
  // ANCHOR: unregister-webook
  String url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>";
  await breezSDK.unregisterWebhook(webhookUrl: url);
  // ANCHOR_END: unregister-webook
}
