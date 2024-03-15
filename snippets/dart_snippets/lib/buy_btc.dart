import 'package:breez_sdk/sdk.dart';

Future<BuyBitcoinResponse> buyBitcoin() async {
  // ANCHOR: buy-btc
  BuyBitcoinRequest req = const BuyBitcoinRequest(
    provider: BuyBitcoinProvider.Moonpay,
  );
  BuyBitcoinResponse resp = await BreezSDK.buyBitcoin(req: req);
  // ANCHOR_END: buy-btc
  return resp;
}
