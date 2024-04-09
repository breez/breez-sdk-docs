import 'package:breez_sdk/breez_sdk.dart';

Future<void> registerWebhook() async {
  // ANCHOR: register-webook
  await BreezSDK().registerWebhook(webhookUrl: "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>");  
  // ANCHOR_END: register-webook
}

Future<void> unregisterWebhook() async {
  // ANCHOR: unregister-webook
  await BreezSDK().unregisterWebhook(webhookUrl: "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>");  
  // ANCHOR_END: unregister-webook
}
