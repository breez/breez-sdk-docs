import breez_sdk

import logging

sdk_services = breez_sdk.BlockingBreezServices
# ANCHOR: init-sdk
class SDKListener(breez_sdk.EventListener):
    def on_event(self, event):
        logging.info(event)

def getting_started():
    
    seed = breez_sdk.mnemonic_to_seed("<mnemonic words>")
    invite_code = "<invite code>"
    api_key = "<api key>"
    config = breez_sdk.default_config(
        breez_sdk.EnvironmentType.PRODUCTION, 
        api_key, 
        breez_sdk.NodeConfig.GREENLIGHT(breez_sdk.GreenlightNodeConfig(None, invite_code)))

    # Customize the config object according to your needs
    config.working_dir = "path to an existing directory"

    try:
        # Connect to the Breez SDK make it ready for use
        sdk_services = breez_sdk.connect(config, seed, SDKListener())
        
        return sdk_services
    except Exception as error:
        logging.error(error)
        raise
    # ANCHOR_END: init-sdk

def getting_started_node_info():
     
    try: 
         # ANCHOR: fetch-balance
        node_info = node_info()
        ln_balance = node_info.channels_balance_msat
        onchain_balance = node_info.onchain_balance_msat
        # ANCHOR_END: fetch-balance
    except Exception as error:
        logging.error(error)
        raise


