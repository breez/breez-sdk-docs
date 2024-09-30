import 'package:dart_snippets/sdk_instance.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<void> getFeeInfoBeforeInvoiceCreated() async {
  // ANCHOR: get-fee-info-before-receiving-payment
  NodeState? nodeInfo = await breezSDK.nodeInfo();
  if (nodeInfo != null) {
    int inboundLiquiditySat = nodeInfo.maxReceivableSinglePaymentAmountMsat ~/ 1000;

    OpenChannelFeeResponse openingFeeResponse = await breezSDK.openChannelFee(req: OpenChannelFeeRequest());

    OpeningFeeParams openingFees = openingFeeResponse.feeParams;
    double feePercentage = (openingFees.proportional * 100) / 1000000;
    int minFeeSat = openingFees.minMsat ~/ 1000;

    if (inboundLiquiditySat == 0) {
        print("A setup fee of $feePercentage% with a minimum of $minFeeSat sats will be applied.");
    } else {
        print("A setup fee of $feePercentage% with a minimum of $minFeeSat sats will be applied for receiving more than $inboundLiquiditySat sats.");
    }
  }
  // ANCHOR_END: get-fee-info-before-receiving-payment
}

Future<void> getFeeInfoAfterInvoiceCreated({required ReceivePaymentResponse receivePaymentResponse}) async {
  // ANCHOR: get-fee-info-after-invoice-created
  int openingFeeSat = (receivePaymentResponse.openingFeeMsat ?? 0) / 1000 as int;
  print("A setup fee of $openingFeeSat sats is applied to this invoice.");
  // ANCHOR_END: get-fee-info-after-invoice-created
}

Future<void> getFeeInfoReceiveOnchain() async {
  // ANCHOR: get-fee-info-receive-onchain
  SwapInfo swapInfo = await breezSDK.receiveOnchain(req: ReceiveOnchainRequest());

  int minDepositSat = swapInfo.minAllowedDeposit;
  int maxDepositSat = swapInfo.maxAllowedDeposit;

  NodeState? nodeInfo = await breezSDK.nodeInfo();
  if (nodeInfo != null) {
    int inboundLiquiditySat = nodeInfo.maxReceivableSinglePaymentAmountMsat ~/ 1000;

    OpeningFeeParams? swapOpeningFees = swapInfo.channelOpeningFees;
    if (swapOpeningFees != null) {
      double feePercentage = (swapOpeningFees.proportional * 100) / 1000000;
      int minFeeSat = swapOpeningFees.minMsat ~/ 1000;

      print("Send more than $minDepositSat sats and up to $maxDepositSat sats to this address. A setup fee of $feePercentage% with a minimum of $minFeeSat sats will be applied for sending more than $inboundLiquiditySat sats. This address can only be used once.");
    }
  }
  // ANCHOR_END: get-fee-info-receive-onchain
}
