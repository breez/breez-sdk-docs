import 'package:breez_sdk/sdk.dart';

Future<ReceivePaymentResponse> receivePayment() async {
  // ANCHOR: receive-payment
  ReceivePaymentRequest req = const ReceivePaymentRequest(
    amountMsat: 3000000,
    description: "Invoice for 3000 sats",
  );
  ReceivePaymentResponse receivePaymentResponse = await BreezSDK.receivePayment(req: req);

  print(receivePaymentResponse.lnInvoice);
  // ANCHOR_END: receive-payment
  return receivePaymentResponse;
}
