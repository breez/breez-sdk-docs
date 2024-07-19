using Breez.Sdk;

public class SendOnchainSnippets
{
    public void GetCurrentLimits(BlockingBreezServices sdk)
    {
        // ANCHOR: get-current-reverse-swap-limits
        try
        {
            var currentLimits = sdk.OnchainPaymentLimits();
            Console.WriteLine($"Minimum amount, in sats: {currentLimits.minSat}");
            Console.WriteLine($"Maximum amount, in sats: {currentLimits.maxSat}");
            Console.WriteLine($"Maximum payable, in sats: {currentLimits.maxPayableSat}");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: get-current-reverse-swap-limits
    }

    public void PreparePayOnchain(BlockingBreezServices sdk, OnchainPaymentLimitsResponse currentLimits, uint feeRate)
    {
        // ANCHOR: prepare-pay-onchain
        var amountSat = currentLimits.minSat;
        var claimTxFeerate = feeRate;

        try
        {
            var prepareRes = sdk.PrepareOnchainPayment(
                new PrepareOnchainPaymentRequest(
                    amountSat,
                    SwapAmountType.SEND,
                    claimTxFeerate));

            Console.WriteLine($"Sender amount, in sats: {prepareRes.senderAmountSat}");
            Console.WriteLine($"Recipient amount, in sats: {prepareRes.recipientAmountSat}");
            Console.WriteLine($"Total fees, in sats: {prepareRes.totalFees}");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: prepare-pay-onchain
    }

    public void StartReverseSwap(BlockingBreezServices sdk, PrepareOnchainPaymentResponse prepareRes)
    {
        // ANCHOR: start-reverse-swap
        var destinationAddress = "bc1..";
        try
        {
            var reverseSwapInfo = sdk.PayOnchain(
                new PayOnchainRequest(destinationAddress, prepareRes));
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: start-reverse-swap
    }

    public void CheckReverseSwapStatus(BlockingBreezServices sdk)
    {
        // ANCHOR: check-reverse-swaps-status
        try
        {
            var swaps = sdk.InProgressOnchainPayments();
            foreach (var swap in swaps)
            {
                Console.WriteLine(
                    $"Onchain payment {swap.id} in progress, " +
                    $"status is {swap.status}`");
            }
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: check-reverse-swaps-status
    }
}
