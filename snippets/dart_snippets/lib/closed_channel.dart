import 'package:dart_snippets/sdk_instance.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<PrepareRedeemOnchainFundsResponse> prepareRedeemOnchainFunds(
    {required int satPerVbyte}) async {
  // ANCHOR: prepare-redeem-onchain-funds
  PrepareRedeemOnchainFundsRequest req = PrepareRedeemOnchainFundsRequest(
    toAddress: "bc1..",
    satPerVbyte: satPerVbyte,
  );
  final resp = await breezSDK.prepareRedeemOnchainFunds(req: req);
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
  final resp = await breezSDK.redeemOnchainFunds(req: req);
  // ANCHOR_END: redeem-onchain-funds
  return resp;
}
