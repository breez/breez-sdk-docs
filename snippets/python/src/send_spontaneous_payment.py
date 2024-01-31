import breez_sdk



def send_spontaneous_payment(sdk_services):
    try:
        # ANCHOR: send-spontaneous-payment
        node_id = "..."
        amount_msat = 3000000

        req = breez_sdk.SendSpontaneousPaymentRequest(node_id,amount_msat)
        result = sdk_services.send_spontaneous_payment(req)
        # ANCHOR_END: send-spontaneous-payment
        return result
    except Exception as error:
        print(error)
        raise


def send_spontaneous_payment_with_tlvs(sdk_services):
    # ANCHOR: send-spontaneous-payment-with-tlvs
    node_id = "..."
    amount_msat = 300000
    extra_tlvs = [breez_sdk.TlvEntry(34349334, str.encode("Hello world!"))]
    try:
        req = breez_sdk.SendSpontaneousPaymentRequest(node_id, amount_msat, extra_tlvs)
        result = sdk_services.send_spontaneous_payment(req)
        # ANCHOR: send-spontaneous-payment-with-tlvs
        return result
    except Exception as error:
        print(error)
        raise