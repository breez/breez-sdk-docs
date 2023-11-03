using Breez.Sdk;

public class LnurlWithdrawSnippets
{
  public void LnurlWithdraw(BlockingBreezServices sdk)
  {
    // ANCHOR: lnurl-withdraw
    // Endpoint can also be of the form:
    // lnurlw://domain.com/lnurl-withdraw?key=val
    var lnurlWithdrawUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk";

    try
    {
      var input = BreezSdkMethods.ParseInput(lnurlWithdrawUrl);
      if (input is InputType.LnUrlWithdraw lnurlw)
      {
        var amountMsat = lnurlw.data.minWithdrawable;
        var result = sdk.WithdrawLnurl(
            new LnUrlWithdrawRequest(
                lnurlw.data,
                amountMsat,
                "comment"));
      }
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: lnurl-withdraw
  }
}
