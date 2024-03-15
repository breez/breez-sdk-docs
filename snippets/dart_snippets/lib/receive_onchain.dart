// ignore_for_file: unused_local_variable

import 'package:breez_sdk/sdk.dart';

Future<SwapInfo> generateReceiveOnchainAddress() async {
  // ANCHOR: generate-receive-onchain-address
  ReceiveOnchainRequest req = const ReceiveOnchainRequest();
  SwapInfo swapInfo = await BreezSDK.receiveOnchain(req: req);

  // Send your funds to the below bitcoin address
  String address = swapInfo.bitcoinAddress;
  print("Minimum amount allowed to deposit in sats: ${swapInfo.minAllowedDeposit}");
  print("Maximum amount allowed to deposit in sats: ${swapInfo.maxAllowedDeposit}");
  return swapInfo;
  // ANCHOR_END: generate-receive-onchain-address
}

Future<SwapInfo?> getInProgressSwap() async {
  // ANCHOR: in-progress-swap
  SwapInfo? swapInfo = await BreezSDK.inProgressSwap();
  // ANCHOR_END: in-progress-swap
  return swapInfo;
}

Future<List<SwapInfo>> listRefundables() async {
  // ANCHOR: list-refundables
  List<SwapInfo> refundables = await BreezSDK.listRefundables();
  // ANCHOR_END: list-refundables
  return refundables;
}

Future<RefundResponse> executeRefund({
  required String swapAddress,
  required String toAddress,
  required int satPerVbyte,
}) async {
  // ANCHOR: execute-refund
  RefundRequest req = RefundRequest(
    swapAddress: swapAddress,
    toAddress: toAddress,
    satPerVbyte: satPerVbyte,
  );
  RefundResponse resp = await BreezSDK.refund(req: req);
  // ANCHOR_END: execute-refund
  return resp;
}

Future<OpenChannelFeeResponse> getChannelOpeningFees({
  required int amountMsat,
  int? expiry,
}) async {
  // ANCHOR: get-channel-opening-fees
  OpenChannelFeeRequest req = OpenChannelFeeRequest(
    amountMsat: amountMsat,
    expiry: expiry,
  );
  OpenChannelFeeResponse resp = await BreezSDK.openChannelFee(req: req);
  // ANCHOR_END: get-channel-opening-fees
  return resp;
}
