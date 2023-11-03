using Breez.Sdk;

public class SendSpontaneousPaymentSnippets
{
  public void SendSpontaneousPayment(BlockingBreezServices sdk)
  {
    // ANCHOR: send-spontaneous-payment
    var nodeId = "...";
    ulong amountMsat = 3_000_000;
    try
    {
      var response = sdk.SendSpontaneousPayment(
          new SendSpontaneousPaymentRequest(nodeId, amountMsat));
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: send-spontaneous-payment
  }
}
