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
    
    public void SendSpontaneousPaymentWithTlvs(BlockingBreezServices sdk)
    {
        // ANCHOR: send-spontaneous-payment-with-tlvs
        var nodeId = "...";
        ulong amountMsat = 3_000_000;
        var extraTlvs = new List<TlvEntry>{
            new TlvEntry(34349334, Encoding.ASCII.GetBytes("Hello world!").ToList())
        };

        try
        {
            var response = sdk.SendSpontaneousPayment(
                new SendSpontaneousPaymentRequest(nodeId, amountMsat, extraTlvs));
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: send-spontaneous-payment-with-tlvs
    }
}
