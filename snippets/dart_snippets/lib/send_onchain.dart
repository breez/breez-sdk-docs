import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<OnchainPaymentLimitsResponse> getCurrentLimits() async {
  // ANCHOR: get-current-reverse-swap-limits
  OnchainPaymentLimitsResponse currentLimits = await BreezSDK().onchainPaymentLimits();
  print("Minimum amount, in sats: ${currentLimits.minSat}");
  print("Maximum amount, in sats: ${currentLimits.maxSat}");
  // ANCHOR_END: get-current-reverse-swap-limits
  return currentLimits;
}

Future<PrepareOnchainPaymentResponse> preparePayOnchain({
  required int amountSat,
  required int satPerVbyte,
}) async {
  // ANCHOR: prepare-pay-onchain
  PrepareOnchainPaymentRequest req = PrepareOnchainPaymentRequest(
    amountSat: amountSat,
    amountType: SwapAmountType.Send,
    claimTxFeerate: satPerVbyte,
  );
  PrepareOnchainPaymentResponse resp = await BreezSDK().prepareOnchainPayment(req: req);
  print("Sender amount: ${resp.senderAmountSat} sats");
  print("Recipient amount: ${resp.recipientAmountSat} sats");
  print("Total fees: ${resp.totalFees} sats");
  // ANCHOR_END: prepare-pay-onchain
  return resp;
}

Future<SendOnchainResponse> startReverseSwap({
  required int amountSat,
  required String onchainRecipientAddress,
  required String pairHash,
  required int satPerVbyte,
}) async {
  // ANCHOR: start-reverse-swap
  SendOnchainRequest req = SendOnchainRequest(
    amountSat: amountSat,
    onchainRecipientAddress: onchainRecipientAddress,
    pairHash: pairHash,
    satPerVbyte: satPerVbyte,
  );
  SendOnchainResponse resp = await BreezSDK().sendOnchain(req: req);
  // ANCHOR_END: start-reverse-swap
  return resp;
}

Future<List<ReverseSwapInfo>> checkReverseSwapStatus() async {
  // ANCHOR: check-reverse-swaps-status
  List<ReverseSwapInfo> inProgRevSwapList = await BreezSDK().inProgressReverseSwaps();
  for (var inProgRevSwap in inProgRevSwapList) {
    print("Reverse swap ${inProgRevSwap.id} in progress, status is ${inProgRevSwap.status.name}");
  }
  // ANCHOR_END: check-reverse-swaps-status
  return inProgRevSwapList;
}
