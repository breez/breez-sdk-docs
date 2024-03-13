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
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: get-current-reverse-swap-limits
    }

    public void MaxReverseSwapAmount(BlockingBreezServices sdk)
    {
        // ANCHOR: max-reverse-swap-amount
        try
        {
            var maxAmountResponse = sdk.MaxReverseSwapAmount();
            Console.WriteLine(
                $"Max reverse swap amount {maxAmountResponse.totalSat}");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: max-reverse-swap-amount
    }

    public void StartReverseSwap(BlockingBreezServices sdk, ReverseSwapPairInfo currentFees, uint feeRate)
    {
        // ANCHOR: start-reverse-swap
        var destinationAddress = "bc1..";
        var amountSat = currentFees.min;
        var satPerVbyte = feeRate;
        try
        {
            var reverseSwapInfo = sdk.SendOnchain(
                new SendOnchainRequest(
                    amountSat,
                    destinationAddress,
                    currentFees.feesHash,
                    satPerVbyte));
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
            var swaps = sdk.InProgressReverseSwaps();
            foreach (var swap in swaps)
            {
                Console.WriteLine(
                    $"Reverse swap {swap.id} in progress, " +
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
