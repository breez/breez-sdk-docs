import breez_sdk


def receive_payment(sdk_services):
    try:
        # ANCHOR: receive-payment
        req = breez_sdk.ReceivePaymentRequest(
            amount_msat=3000000,
            description="Invoice for 3 000 sats")
        receive_payment_response = sdk_services.receive_payment(req)

        invoice = receive_payment_response.ln_invoice
        # ANCHOR_END: receive-payment
        return receive_payment_response
    except Exception as error:
        print(error)
        raise