using Breez.Sdk;
using System;
using System.Text;

public class SendSpontaneousPaymentSnippets
{
    public void SendSpontaneousPayment(BlockingBreezServices sdk)
    {
        // ANCHOR: send-spontaneous-payment
        var nodeId = "...";
        ulong amountMsat = 3_000_000;
        var optionalLabel = "<label>";

        try
        {
            var response = sdk.SendSpontaneousPayment(
                new SendSpontaneousPaymentRequest(nodeId, amountMsat, label: optionalLabel));
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: send-spontaneous-payment
    }    
    
    public void SendSpontaneousPaymentWithTlvs(BlockingBreezServices sdk)
    {
        // ANCHOR: send-spontaneous-payment-with-tlvs
        var nodeId = "...";
        ulong amountMsat = 3_000_000;
        var optionalExtraTlvs = new List<TlvEntry>{
            new TlvEntry(34349334, Encoding.ASCII.GetBytes("Hello world!").ToList())
        };

        try
        {
            var response = sdk.SendSpontaneousPayment(
                new SendSpontaneousPaymentRequest(nodeId, amountMsat, optionalExtraTlvs));
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: send-spontaneous-payment-with-tlvs
    }
}
