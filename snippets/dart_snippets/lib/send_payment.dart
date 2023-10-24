import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<SendPaymentResponse> buyBitcoin({required String bolt11}) async {
  // ANCHOR: send-payment
  SendPaymentRequest req = SendPaymentRequest(bolt11: bolt11);
  SendPaymentResponse resp = await BreezSDK().sendPayment(req: req);
  // ANCHOR_END: send-payment
  return resp;
}
