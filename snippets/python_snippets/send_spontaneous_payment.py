import breez_sdk
import logging

sdk_services = breez_sdk.BlockingBreezServices

def send_spontaneous_payment():
    # ANCHOR: send-spontaneous-payment
    node_id = "..."
    amount_msat = 300000
    try:
        req = breez_sdk.SendSpontaneousPaymentRequest(node_id,amount_msat)
        result = sdk_services.send_spontaneous_payment(req)
        return result
    # ANCHOR: send-spontaneous-payment
    except Exception as error:
        logging.error(error)
        raise