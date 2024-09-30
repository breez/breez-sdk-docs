using Breez.Sdk;

public class SendPaymentSnippets
{
    public void SendPayment(BlockingBreezServices sdk)
    {
        // ANCHOR: send-payment
        var bolt11 = "...";
        var useTrampoline = false;
        ulong optionalAmountMsat = 3_000_000;
        var optionalLabel = "<label>";
        
        
        try
        {
            // The `amountMsat` param is optional and should only passed if the
            // bolt11 doesn't specify an amount.
            // The amountMsat is required in case an amount is not specified in
            // the bolt11 invoice.
            var response = sdk.SendPayment(
                new SendPaymentRequest(bolt11, useTrampoline, optionalAmountMsat, optionalLabel));
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: send-payment
    }
}
