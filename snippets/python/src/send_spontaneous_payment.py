import breez_sdk



def send_spontaneous_payment(sdk_services):
    # ANCHOR: send-spontaneous-payment
    node_id = "..."
    amount_msat = 3000000
    optional_label = "<label>"
    try:
        req = breez_sdk.SendSpontaneousPaymentRequest(
            node_id=node_id,
            amount_msat=amount_msat,
            label=optional_label)
        result = sdk_services.send_spontaneous_payment(req=req)
        return result
    except Exception as error:
        print(error)
        raise
    # ANCHOR_END: send-spontaneous-payment

def send_spontaneous_payment_with_tlvs(sdk_services):
    # ANCHOR: send-spontaneous-payment-with-tlvs
    node_id = "..."
    amount_msat = 300000
    optional_extra_tlvs = [breez_sdk.TlvEntry(34349334, str.encode("Hello world!"))]
    try:
        req = breez_sdk.SendSpontaneousPaymentRequest(
            node_id=node_id,
            amount_msat=amount_msat,
            extra_tlvs=optional_extra_tlvs)
        result = sdk_services.send_spontaneous_payment(req=req)
        return result
    except Exception as error:
        print(error)
        raise        
    # ANCHOR: send-spontaneous-payment-with-tlvs
