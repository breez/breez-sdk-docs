import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<SendPaymentResponse> sendPayment({required String bolt11}) async {
  // ANCHOR: send-payment
  // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
  // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
  SendPaymentRequest req = SendPaymentRequest(bolt11: bolt11,  amountMsat: 3000000);
  SendPaymentResponse resp = await BreezSDK().sendPayment(req: req);
  // ANCHOR_END: send-payment
  return resp;
}
