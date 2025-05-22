import breez_sdk

def register_webhook(sdk_services):
    try:
        # ANCHOR: register-webook
        url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
        sdk_services.register_webhook(webhook_url=url)
        # ANCHOR_END: register-webook
    except Exception as error:
        print(error)
        raise

def unregister_webhook(sdk_services):
    try:
        # ANCHOR: unregister-webook
        url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
        sdk_services.unregister_webhook(webhook_url=url)
        # ANCHOR_END: unregister-webook
    except Exception as error:
        print(error)
        raise
