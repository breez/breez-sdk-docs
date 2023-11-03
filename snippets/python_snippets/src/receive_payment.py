import breez_sdk


def receive_payment(sdk_services):
    try:
        # ANCHOR: receive-payment
        req = breez_sdk.ReceivePaymentRequest(
        amount_msat=3000000,
        description="Invoice for 3 000 000 sats")
        result = sdk_services.receive_payment(req)
        # ANCHOR_END: receive-payment
        return result
    except Exception as error:
        print(error)
        raise