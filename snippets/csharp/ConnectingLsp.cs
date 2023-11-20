using Breez.Sdk;

public class ConnectingLspSnippets
{
    public void GetLspInfo(BlockingBreezServices sdk)
    {
        // ANCHOR: get-lsp-info
        try
        {
            var lspId = sdk.LspId();
            var lspInfo = sdk.LspInfo();
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: get-lsp-info
    }

    public void ListLsps(BlockingBreezServices sdk)
    {
        // ANCHOR: list-lsps
        try
        {
            var availableLsps = sdk.ListLsps();
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: list-lsps
    }

    public void ConnectLsp(BlockingBreezServices sdk, string? lspId)
    {
        // ANCHOR: connect-lsp
        try
        {
            sdk.ConnectLsp(lspId!);
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: connect-lsp
    }
}
