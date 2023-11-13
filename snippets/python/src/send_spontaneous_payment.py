import breez_sdk



def send_spontaneous_payment(sdk_services):
    # ANCHOR: send-spontaneous-payment
    node_id = "..."
    amount_msat = 300000
    try:
        req = breez_sdk.SendSpontaneousPaymentRequest(node_id,amount_msat)
        result = sdk_services.send_spontaneous_payment(req)
        # ANCHOR: send-spontaneous-payment
        return result
    except Exception as error:
        print(error)
        raise