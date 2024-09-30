import breez_sdk


def send_payment(sdk_services):
    # ANCHOR: send-payment
    bolt11 = "..."
    try:
        use_trampoline = False
        # The `amount_msat` param is optional and should only passed if the bolt11 doesn't specify an amount.
        # The amount_msat is required in case an amount is not specified in the bolt11 invoice'.
        optional_amount_msat = 3000000
        optional_label = "<label>"
        req = breez_sdk.SendPaymentRequest(bolt11=bolt11, use_trampoline=use_trampoline, amount_msat=optional_amount_msat, label=optional_label)
        sdk_services.send_payment(req=req)
    except Exception as error:
        print(error)
        raise        
    # ANCHOR_END: send-payment
