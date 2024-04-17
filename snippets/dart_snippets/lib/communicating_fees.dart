import 'package:breez_sdk/bridge_generated.dart';

Future<void> getFeeInfoAfterInvoiceCreated({required ReceivePaymentResponse receivePaymentResponse}) async {
  // ANCHOR: get-fee-info-after-invoice-created
  int openingFeeSat = (receivePaymentResponse.openingFeeMsat ?? 0) / 1000 as int;
  print("A setup fee of $openingFeeSat sats is applied to this invoice.");
  // ANCHOR_END: get-fee-info-after-invoice-created
}
