using Breez.Sdk;

public class SendOnchainSnippets
{
    public void GetCurrentFees(BlockingBreezServices sdk)
    {
        // ANCHOR: estimate-current-reverse-swap-total-fees
        try
        {
            var currentFees = sdk.FetchReverseSwapFees(
                new ReverseSwapFeesRequest(50000));
            Console.WriteLine(
                $"Total estimated fees for reverse " +
                $"swap: {currentFees.totalEstimatedFees}");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: estimate-current-reverse-swap-total-fees
    }

    public void ListCurrentFees(BlockingBreezServices sdk, ReverseSwapPairInfo currentFees)
    {
        // ANCHOR: get-current-reverse-swap-min-max
        Console.WriteLine($"Minimum amount, in sats: {currentFees.min}");
        Console.WriteLine($"Maximum amount, in sats: {currentFees.max}");
        // ANCHOR_END: get-current-reverse-swap-min-max
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
