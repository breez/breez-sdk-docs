import breez_sdk

import logging


# ANCHOR: init-sdk
class SDKListener(breez_sdk.EventListener):
    def on_event(self, event):
        logging.info(event)

def getting_started(API_KEY,mnemonic,temp_dir):
    
    seed = breez_sdk.mnemonic_to_seed(mnemonic)
    invite_code = "<invite code>"
    api_key = API_KEY
    config = breez_sdk.default_config(
        breez_sdk.EnvironmentType.PRODUCTION, 
        api_key, 
        breez_sdk.NodeConfig.GREENLIGHT(breez_sdk.GreenlightNodeConfig(None, invite_code)))

    # Customize the config object according to your needs
    config.working_dir = temp_dir

    try:
        # Connect to the Breez SDK make it ready for use
        sdk_services = breez_sdk.connect(config, seed, SDKListener())
        
        return sdk_services
    except Exception as error:
        logging.error(error)
        raise
    # ANCHOR_END: init-sdk

def getting_started_node_info(sdk_services):
     
    try: 
         # ANCHOR: fetch-balance
        node_info = sdk_services.node_info()
        ln_balance = node_info.channels_balance_msat
        onchain_balance = node_info.onchain_balance_msat
        # ANCHOR_END: fetch-balance
        return node_info
    except Exception as error:
        logging.error(error)
        raise


