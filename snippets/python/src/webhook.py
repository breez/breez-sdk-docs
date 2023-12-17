import breez_sdk

def webhook(sdk_services):
    try: 
        # ANCHOR: register-webook
        sdk_services.registerWebhook("https://yourapplication.com")    
        # ANCHOR_END: register-webook
    except Exception as error: 
        print(error)
        raise

def paymentWebhook(sdk_services):
    try:
       # ANCHOR: register-payment-webook
      sdk_services.registerWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")
      # ANCHOR_END: register-payment-webook
    except Exception as error:
        print(error)
        raise
