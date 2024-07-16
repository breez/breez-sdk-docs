import 'package:dart_snippets/sdk_instance.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<void> lnurlPay() async {
  // ANCHOR: lnurl-pay
  /// Endpoint can also be of the form:
  /// lnurlp://domain.com/lnurl-pay?key=val
  /// lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
  String lnurlPayUrl = "lightning@address.com";

  InputType inputType = await breezSDK.parseInput(input: lnurlPayUrl);
  if (inputType is InputType_LnUrlPay) {
    int amountMsat = inputType.data.minSendable;
    String optionalComment = "<comment>";
    String optionalPaymentLabel = "<label>";
    bool optionalValidateSuccessActionUrl = true;
    LnUrlPayRequest req = LnUrlPayRequest(
      data: inputType.data,
      amountMsat: amountMsat,
      comment: optionalComment,
      paymentLabel: optionalPaymentLabel,
      validateSuccessActionUrl: optionalValidateSuccessActionUrl,
    );
    LnUrlPayResult result = await breezSDK.lnurlPay(req: req);
    print(result.data);
  }
  // ANCHOR_END: lnurl-pay
}
