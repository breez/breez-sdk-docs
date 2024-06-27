using Breez.Sdk;

public class ProductionSnippets
{
    public NodeConfig ProductionNodeConfig() {
        // ANCHOR: moving-to-production
        // Read in your Greenlight credentials from the file 
        // system, environment variable or build config
        var developerKey = new List<byte>();
        var developerCert = new List<byte>();
        var greenlightCredentials = new GreenlightCredentials(developerKey, developerCert);
        
        var nodeConfig = new NodeConfig.Greenlight(
            new GreenlightNodeConfig(greenlightCredentials, null)
        );
        // ANCHOR_END: moving-to-production
        return nodeConfig;
    }
}
