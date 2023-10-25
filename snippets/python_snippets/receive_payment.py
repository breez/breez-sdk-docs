import breez_sdk
import logging

sdk_services = breez_sdk.BlockingBreezServices

def receive_payment():
    try:
        # ANCHOR: receive-payment
        req = breez_sdk.ReceivePaymentRequest(
        amount_msat=300000,
        description="Invoice for 300 000 sats")
        result = sdk_services.receive_payment(req)
        # ANCHOR_END: receive-payment
        return result
    except Exception as error:
        logging.error(error)
        raise