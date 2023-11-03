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
