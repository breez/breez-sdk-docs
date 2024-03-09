using Breez.Sdk;

public class GettingStartedSnippets
{
    // ANCHOR: init-sdk
    public void GettingStarted()
    {
        // Create the default config
        var seed = BreezSdkMethods.MnemonicToSeed("<mnemonic words>");
        var inviteCode = "<invite code>";
        var apiKey = "<api key>";
        var nodeConfig = new NodeConfig.Greenlight(
            new GreenlightNodeConfig(null, inviteCode)
        );
        var config = BreezSdkMethods.DefaultConfig(
            EnvironmentType.PRODUCTION,
            apiKey,
            nodeConfig
        ) with
        {
            // Customize the config object according to your needs
            workingDir = "path to an existing directory"
        };

        BlockingBreezServices sdk;
        try
        {
            // Connect to the Breez SDK make it ready for use
            sdk = BreezSdkMethods.Connect(new ConnectRequest(config, seed), new SdkListener());
        }
        catch (Exception)
        {
            // Handle error
        }
    }

    // SDK event listener
    class SdkListener : EventListener
    {
        public void OnEvent(BreezEvent e)
        {
            Console.WriteLine($"Received Breez event type {e.GetType().Name}");
        }
    }
    // ANCHOR_END: init-sdk

    public void FetchNodeInfo(BlockingBreezServices sdk)
    {
        // ANCHOR: fetch-balance
        try
        {
            var nodeInfo = sdk.NodeInfo();
            var lnBalance = nodeInfo?.channelsBalanceMsat;
            var onchainBalance = nodeInfo?.onchainBalanceMsat;
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: fetch-balance
    }
}
