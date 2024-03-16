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
  PrepareOnchainPaymentResponse prepareRes = await BreezSDK().prepareOnchainPayment(req: req);
  print("Sender amount: ${prepareRes.senderAmountSat} sats");
  print("Recipient amount: ${prepareRes.recipientAmountSat} sats");
  print("Total fees: ${prepareRes.totalFees} sats");
  // ANCHOR_END: prepare-pay-onchain
  return prepareRes;
}

Future<PayOnchainResponse> startReverseSwap({
  required String onchainRecipientAddress,
  required PrepareOnchainPaymentResponse prepareRes,
}) async {
  // ANCHOR: start-reverse-swap
  PayOnchainRequest req = PayOnchainRequest(
    recipientAddress: onchainRecipientAddress,
    prepareRes: prepareRes,
  );
  PayOnchainResponse res = await BreezSDK().payOnchain(req: req);
  // ANCHOR_END: start-reverse-swap
  return res;
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
