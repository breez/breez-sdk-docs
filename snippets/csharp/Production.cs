using Breez.Sdk;

public class ProductionSnippets
{
    public NodeConfig ProductionNodeConfig() {
        // ANCHOR: moving-to-production
        // Read in your Greenlight credentials from the file 
        // system, environment variable or build config
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
