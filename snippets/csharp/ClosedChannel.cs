using Breez.Sdk;

public class ClosedChannelSnippets
{
    public void PrepareRedeemOnchainFunds(BlockingBreezServices sdk, uint feeRate) 
    {
        // ANCHOR: prepare-redeem-onchain-funds  
        var destinationAddress = "bc1..";
        var satPerVbyte = feeRate; 
        try 
        {
            var prepareRedeemOnchainFundsResp = sdk.PrepareRedeemOnchainFunds(
                new PrepareRedeemOnchainFundsRequest(
                    destinationAddress,
                    satPerVbyte
                ));
        }
        catch (Exception)
        {
            // Handle error
        }
         // ANCHOR_END: prepare-redeem-onchain-funds
    }

    public void RedeemOnchainFunds(BlockingBreezServices sdk, uint satPerVbyte, string toAddress) 
    {
        // ANCHOR: redeem-onchain-funds  
        try 
        {
            var redeemOnchainFundsResp = sdk.RedeemOnchainFunds(
                new RedeemOnchainFundsRequest(
                    toAddress,
                    satPerVbyte
                ));
        }
        catch (Exception)
        {
            // Handle error
        }
         // ANCHOR_END: redeem-onchain-funds
    }

}