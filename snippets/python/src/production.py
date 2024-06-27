import breez_sdk

def production_node_config():
    # ANCHOR: moving-to-production
    # Read in your Greenlight credentials from the file 
    # system, environment variable or build config
    developerKey = []
    developerCert = []
    greenlightCredentials = breez_sdk.GreenlightCredentials(developerKey, developerCert)

    node_config = breez_sdk.NodeConfig.GREENLIGHT(
        breez_sdk.GreenlightNodeConfig(greenlightCredentials, None))
    # ANCHOR_END: moving-to-production
    return node_config
