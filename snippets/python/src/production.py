import breez_sdk

def production_node_config():
    # ANCHOR: moving-to-production
    # Read in your Greenlight credentials from the file 
    # system, environment variable or build config
    developer_key = []
    developer_cert = []
    greenlight_credentials = breez_sdk.GreenlightCredentials(
        developer_key=developer_key,
        developer_cert=developer_cert)

    node_config = breez_sdk.NodeConfig.GREENLIGHT(
        config=breez_sdk.GreenlightNodeConfig(
            partner_credentials=greenlight_credentials,
            invite_code=None))
    # ANCHOR_END: moving-to-production
    return node_config
