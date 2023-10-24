import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<SendPaymentResponse> sendSpontaneousPayment({
  required String nodeId,
}) async {
  // ANCHOR: send-spontaneous-payment
  SendSpontaneousPaymentRequest req = SendSpontaneousPaymentRequest(
    amountMsat: 3000000,
    nodeId: nodeId,
  );
  SendPaymentResponse resp = await BreezSDK().sendSpontaneousPayment(req: req);
  // ANCHOR_END: send-spontaneous-payment
  return resp;
}
