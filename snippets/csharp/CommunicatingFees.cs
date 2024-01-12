using Breez.Sdk;

public class CommunicatingFeesSnippets
{
    public void GetFeeInfoAfterInvoiceCreated(ReceivePaymentResponse receivePaymentResponse)
    {
        // ANCHOR: get-fee-info-after-invoice-created
        var openingFeeSat = receivePaymentResponse.openingFeeMsat.GetValueOrDefault() / 1000;
        Console.WriteLine($"A setup fee of {openingFeeSat} sats is applied to this invoice.");
        // ANCHOR_END: get-fee-info-after-invoice-created
    }
}
