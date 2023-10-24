import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<void> lnurlWithdraw() async {
  // ANCHOR: lnurl-withdraw
  /// Endpoint can also be of the form:
  /// lnurlp://domain.com/lnurl-pay?key=val
  /// lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
  String lnurlPayUrl = "lightning@address.com";

  InputType inputType = await BreezSDK().parseInput(input: lnurlPayUrl);
  if (inputType is InputType_LnUrlWithdraw) {
    int amountMsat = inputType.data.minWithdrawable;
    LnUrlWithdrawRequest req = LnUrlWithdrawRequest(
      data: inputType.data,
      amountMsat: amountMsat,
      description: "<description>",
    );
    LnUrlWithdrawResult result = await BreezSDK().lnurlWithdraw(req: req);
    print(result.data);
  }
  // ANCHOR_END: lnurl-withdraw
}
