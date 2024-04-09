import breez_sdk

def register_webhook(sdk_services):
    try:
        # ANCHOR: register-webook
        sdk_services.register_webhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")
        # ANCHOR_END: register-webook
    except Exception as error:
        print(error)
        raise

def unregister_webhook(sdk_services):
    try:
        # ANCHOR: unregister-webook
        sdk_services.unregister_webhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")
        # ANCHOR_END: unregister-webook
    except Exception as error:
        print(error)
        raise
