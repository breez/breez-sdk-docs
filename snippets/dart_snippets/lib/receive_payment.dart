import 'package:dart_snippets/sdk_instance.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<ReceivePaymentResponse> receivePayment() async {
  // ANCHOR: receive-payment
  ReceivePaymentRequest req = const ReceivePaymentRequest(
    amountMsat: 3000000,
    description: "Invoice for 3000 sats",
  );
  ReceivePaymentResponse receivePaymentResponse = await breezSDK.receivePayment(req: req);

  print(receivePaymentResponse.lnInvoice);
  // ANCHOR_END: receive-payment

  return receivePaymentResponse;
}
