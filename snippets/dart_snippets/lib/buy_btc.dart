import 'package:breez_sdk/bridge_generated.dart';
import 'package:dart_snippets/sdk_instance.dart';

Future<BuyBitcoinResponse> buyBitcoin() async {
  // ANCHOR: buy-btc
  BuyBitcoinRequest req = const BuyBitcoinRequest(provider: BuyBitcoinProvider.Moonpay);
  BuyBitcoinResponse resp = await breezSDK.buyBitcoin(req: req);
  // ANCHOR_END: buy-btc
  return resp;
}
