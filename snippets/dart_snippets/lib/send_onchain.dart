import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<ReverseSwapPairInfo> estimateCurrentFees() async {
  // ANCHOR: estimate-current-reverse-swap-total-fees
  ReverseSwapFeesRequest req = const ReverseSwapFeesRequest(sendAmountSat: 50000);
  ReverseSwapPairInfo currentFees = await BreezSDK().fetchReverseSwapFees(req: req);
  print("Total estimated fees for reverse swap: ${currentFees.totalFees}");
  // ANCHOR_END: estimate-current-reverse-swap-total-fees
  return currentFees;
}

void listCurrentFees({required ReverseSwapPairInfo currentFees}) {
  // ANCHOR: get-current-reverse-swap-min-max
  print("Minimum amount, in sats: ${currentFees.min}");
  print("Maximum amount, in sats: ${currentFees.max}");
  // ANCHOR_END: get-current-reverse-swap-min-max
}

Future<MaxReverseSwapAmountResponse> maxReverseSwapAmount() async {
  // ANCHOR: max-reverse-swap-amount  
  MaxReverseSwapAmountResponse maxAmount = await BreezSDK().maxReverseSwapAmount();
  print("Max reverse swap amount: ${maxAmount.totalSat}");
  // ANCHOR_END: max-reverse-swap-amount
  return maxAmount;
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
