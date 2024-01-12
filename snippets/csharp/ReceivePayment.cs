using Breez.Sdk;

public class ReceivePaymentSnippets
{
    public void ReceivePayment(BlockingBreezServices sdk)
    {
        // ANCHOR: receive-payment
        try
        {
            var receivePaymentResponse = sdk.ReceivePayment(
                new ReceivePaymentRequest(3_000_000, "Invoice for 3000 sats"));

            var invoice = receivePaymentResponse.lnInvoice;
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: receive-payment
    }
}
