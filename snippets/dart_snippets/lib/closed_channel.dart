import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<PrepareRedeemOnchainFundsResponse> prepareRedeemOnchainFunds({required int feeRate}) async {
  // ANCHOR: prepare-redeem-onchain-funds
  final satPerVbyte = feeRate;
  PrepareRedeemOnchainFundsRequest req = PrepareRedeemOnchainFundsRequest(
    toAddress: "bc1..",
    satPerVbyte: satPerVbyte,
  );
  final resp = await BreezSDK().prepareRedeemOnchainFunds(req: req);
  // ANCHOR_END: prepare-redeem-onchain-funds
  return resp;
}

Future<RedeemOnchainFundsResponse> redeemOnchainFunds(
    {required int satPerVbyte, required String toAddress}) async {
  // ANCHOR: redeem-onchain-funds
  RedeemOnchainFundsRequest req = RedeemOnchainFundsRequest(
    toAddress: "bc1..",
    satPerVbyte: satPerVbyte,
  );
  final resp = await BreezSDK().redeemOnchainFunds(req: req);
  // ANCHOR_END: redeem-onchain-funds
  return resp;
}
