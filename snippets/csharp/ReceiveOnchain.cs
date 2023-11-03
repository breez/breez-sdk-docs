using Breez.Sdk;

public class ReceiveOnchainSnippets
{
  public void ReceiveOnchain(BlockingBreezServices sdk)
  {
    // ANCHOR: generate-receive-onchain-address
    try
    {
      var swapInfo = sdk.ReceiveOnchain(new ReceiveOnchainRequest());

      // Send your funds to the below bitcoin address
      var address = swapInfo.bitcoinAddress;
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: generate-receive-onchain-address
  }

  public void GetInProgressSwap(BlockingBreezServices sdk)
  {
    // ANCHOR: in-progress-swap
    try
    {
      var swapInfo = sdk.InProgressSwap();
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: in-progress-swap
  }

  public void ListRefundables(BlockingBreezServices sdk)
  {
    // ANCHOR: list-refundables
    try
    {
      var refundables = sdk.ListRefundables();
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: list-refundables
  }

  public void ExecuteRefund(BlockingBreezServices sdk, uint refundTxFeeRate, SwapInfo refundable)
  {
    // ANCHOR: execute-refund
    var destinationAddress = "...";
    var satPerVbyte = refundTxFeeRate;
    try
    {
      var result = sdk.Refund(
          new RefundRequest(
              refundable.bitcoinAddress,
              destinationAddress,
              satPerVbyte));
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: execute-refund
  }

  public void GetChannelOpeningFees(BlockingBreezServices sdk, ulong amountMsat)
  {
    // ANCHOR: get-channel-opening-fees
    try
    {
      var channelFees = sdk.OpenChannelFee(
          new OpenChannelFeeRequest(amountMsat));
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: get-channel-opening-fees
  }
}
