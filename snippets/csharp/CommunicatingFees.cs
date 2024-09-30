using Breez.Sdk;

public class CommunicatingFeesSnippets
{
    public void getFeeInfoBeforeInvoiceCreated(BlockingBreezServices sdk)
    {
        // ANCHOR: get-fee-info-before-receiving-payment
        try
        {
            var nodeInfo = sdk.NodeInfo();

            var inboundLiquiditySat = nodeInfo?.maxReceivableSinglePaymentAmountMsat / 1_000;

            var openingFeeResponse = sdk.OpenChannelFee(new OpenChannelFeeRequest(null));
            var openingFees = openingFeeResponse?.feeParams;
            if (openingFees != null)
            {
                var feePercentage = (openingFees.proportional * 100) / 1_000_000.0;
                var minFeeSat = openingFees.minMsat / 1_000;

                if (inboundLiquiditySat == 0)
                {
                    Console.WriteLine(
                        $"A setup fee of {feePercentage}% with a minimum of {minFeeSat} sats will be applied."
                    );
                }
                else
                {
                    Console.WriteLine(
                        $"A setup fee of {feePercentage}% with a minimum of {minFeeSat} sats will be applied " +
                        $"for receiving more than {inboundLiquiditySat} sats."
                    );
                }
            }
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: get-fee-info-before-receiving-payment
    }

    public void GetFeeInfoAfterInvoiceCreated(ReceivePaymentResponse receivePaymentResponse)
    {
        // ANCHOR: get-fee-info-after-invoice-created
        var openingFeeSat = receivePaymentResponse.openingFeeMsat.GetValueOrDefault() / 1000;
        Console.WriteLine($"A setup fee of {openingFeeSat} sats is applied to this invoice.");
        // ANCHOR_END: get-fee-info-after-invoice-created
    }

    public void getFeeInfoReceiveOnchain(BlockingBreezServices sdk)
    {
        // ANCHOR: get-fee-info-receive-onchain
        try
        {
            var swapInfo = sdk.ReceiveOnchain(new ReceiveOnchainRequest());

            var minDepositSat = swapInfo?.minAllowedDeposit;
            var maxDepositSat = swapInfo?.maxAllowedDeposit;

            var nodeInfo = sdk.NodeInfo();
            var inboundLiquiditySat = nodeInfo?.maxReceivableSinglePaymentAmountMsat / 1_000;

            var swapOpeningFees = swapInfo?.channelOpeningFees;
            if (swapOpeningFees != null)
            {
                var feePercentage = (swapOpeningFees.proportional * 100) / 1_000_000.0;
                var minFeeSat = swapOpeningFees.minMsat / 1_000;

                Console.WriteLine(
                    $"Send more than {minDepositSat} sats and up to {maxDepositSat} sats to this address. " +
                    $"A setup fee of {feePercentage}% with a minimum of {minFeeSat} sats will be applied " +
                    $"for sending more than {inboundLiquiditySat} sats. This address can only be used once."
                );
            }
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: get-fee-info-receive-onchain
    }
}
