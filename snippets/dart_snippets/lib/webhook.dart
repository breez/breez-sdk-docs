import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<void> webhook() async {
  // ANCHOR: register-webook
  await BreezSDK().registerWebhook("https://yourapplication.com");
  // ANCHOR_END: register-webook
}

Future<void> paymentWebhook({required String paymentHash}) async {
  // ANCHOR: register-payment-webook
  await BreezSDK().registerWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>");  
  // ANCHOR_END: register-payment-webook
}
