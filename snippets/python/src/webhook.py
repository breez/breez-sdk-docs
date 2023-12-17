import breez_sdk

def webhook(sdk_services):
    try: 
        # ANCHOR: register-webook
        sdk_services.register_webhook("https://yourapplication.com")    
        # ANCHOR_END: register-webook
    except Exception as error: 
        print(error)
        raise

def payment_webhook(sdk_services):
    try:
        # ANCHOR: register-payment-webook
        sdk_services.register_webhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")
        # ANCHOR_END: register-payment-webook
    except Exception as error:
        print(error)
        raise
