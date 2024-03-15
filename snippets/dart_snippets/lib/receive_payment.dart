import 'package:breez_sdk/sdk.dart';

Future<LNInvoice> receivePayment() async {
  // ANCHOR: receive-payment
  ReceivePaymentRequest req = const ReceivePaymentRequest(
    amountMsat: 3000000,
    description: "Invoice for 3000 sats",
  );
  ReceivePaymentResponse resp = await BreezSDK.receivePayment(req: req);

  LNInvoice lnInvoice = resp.lnInvoice;
  // ANCHOR_END: receive-payment
  return lnInvoice;
}
