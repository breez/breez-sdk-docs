using Breez.Sdk;

public class BuyBtcSnippets
{
  public void BuyBtc(BlockingBreezServices sdk)
  {
    // ANCHOR: buy-btc
    try
    {
      var buyBitcoinResponse = sdk.BuyBitcoin(
                      new BuyBitcoinRequest(BuyBitcoinProvider.MOONPAY));
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: buy-btc
  }
}
