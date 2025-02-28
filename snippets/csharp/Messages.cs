using Breez.Sdk;

public class MessagesSnippets
{
    public void SignMessage(BlockingBreezServices sdk)
    {
        // ANCHOR: sign-message
        var message = "<message to sign>";
        try
        {
            var signMessageResponse = sdk.SignMessage(new SignMessageRequest(message));

            // Get the node info for your pubkey
            var info = sdk.NodeInfo();

            var signature = signMessageResponse?.signature;
            var pubkey = info?.id;

            Console.WriteLine($"Pubkey: {pubkey}");
            Console.WriteLine($"Signature: {signature}");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: sign-message
    }

    public void CheckMessage(BlockingBreezServices sdk)
    {
        // ANCHOR: check-message
        var message = "<message>";
        var pubkey = "<pubkey of signer>";
        var signature = "<message signature>";
        try
        {
            var checkMessageRequest = new CheckMessageRequest(message, pubkey, signature);
            var checkMessageResponse = sdk.CheckMessage(checkMessageRequest);

            var isValid = checkMessageResponse?.isValid;

            Console.WriteLine($"Signature valid: {isValid}");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: check-message
    }
}
