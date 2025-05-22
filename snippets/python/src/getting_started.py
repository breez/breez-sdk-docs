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
        env_type=breez_sdk.EnvironmentType.PRODUCTION, 
        api_key=api_key, 
        node_config=breez_sdk.NodeConfig.GREENLIGHT(
            config=breez_sdk.GreenlightNodeConfig(
                partner_credentials=None,
                invite_code=invite_code)))

    # Customize the config object according to your needs
    config.working_dir = temp_dir

    try:
        # Connect to the Breez SDK make it ready for use
        connect_request = breez_sdk.ConnectRequest(
            config=config,
            seed=seed)
        sdk_services = breez_sdk.connect(
            req=connect_request,
            listener=SDKListener())
        
        return sdk_services
    except Exception as error:
        logging.error(error)
        raise
# ANCHOR_END: init-sdk

def getting_started_restore_only(config, seed):
    try:
        # ANCHOR: init-sdk-restore-only
        connect_request = breez_sdk.ConnectRequest(
            config=config,
            seed=seed,
            restore_only=True)
        sdk_services = breez_sdk.connect(
            req=connect_request,
            listener=SDKListener())
        # ANCHOR_END: init-sdk-restore-only
        return sdk_services
    except Exception as error:
        logging.error(error)
        raise

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

# ANCHOR: logging
class SDKLogStream(breez_sdk.LogStream):
    def log(self, l):
        print("Received log [", l.level, "]: ", l.line)

def logging():
    try:
        breez_sdk.set_log_stream(log_stream=SDKLogStream())
    except Exception as error:
        print(error)
        raise
# ANCHOR_END: logging

# ANCHOR: disconnect
def disconnect(sdk_services):
    try:
        sdk_services.disconnect()
    except Exception as error:
        logging.error(error)
        raise
# ANCHOR_END: disconnect
