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
            EnvironmentType.Production,
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
            var connectRequest = new ConnectRequest(config, seed);
            sdk = BreezSdkMethods.Connect(connectRequest, new SdkListener());
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

    public void GettingStartedRestoreOnly(Config config, List<byte> seed)
    {
        BlockingBreezServices sdk;
        try
        {
            // ANCHOR: init-sdk-restore-only
            var connectRequest = new ConnectRequest(config, seed, true);
            sdk = BreezSdkMethods.Connect(connectRequest, new SdkListener());
            // ANCHOR_END: init-sdk-restore-only
        }
        catch (Exception)
        {
            // Handle error
        }
    }

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

    // ANCHOR: logging
    public void GettingStartedLogging()
    {
        try
        {
            BreezSdkMethods.SetLogStream(new SdkLogStream());
        }
        catch (Exception)
        {
            // Handle error
        }
    }

    class SdkLogStream : LogStream
    {
        public void Log(LogEntry l)
        {
            Console.WriteLine($"Received Log [{l.level}]: {l.line}");
        }
    }
    // ANCHOR_END: logging

    // ANCHOR: disconnect
    public void Disconnect(BlockingBreezServices sdk)
    {
        try
        {
            sdk.Disconnect();
        }
        catch (Exception)
        {
            // Handle error
        }
    }
    // ANCHOR_END: disconnect
}
