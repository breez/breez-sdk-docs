using Breez.Sdk;

public class ProductionSnippets
{
    public NodeConfig ProductionNodeConfig() {
        // ANCHOR: moving-to-production
        // Read your Greenlight credentials from secure storage
        var deviceKey = new List<byte>();
        var deviceCert = new List<byte>();
        var greenlightCredentials = new GreenlightCredentials(deviceKey, deviceCert);
        
        var nodeConfig = new NodeConfig.Greenlight(
            new GreenlightNodeConfig(greenlightCredentials, null)
        );
        // ANCHOR_END: moving-to-production
        return nodeConfig;
    }
}
