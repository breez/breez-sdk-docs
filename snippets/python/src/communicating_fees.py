import breez_sdk

def get_fee_info_after_invoice_created(receive_payment_response):
    try:
        # ANCHOR: get-fee-info-after-invoice-created
        opening_fee_msat = receive_payment_response.opening_fee_msat
        opening_fee_sat = opening_fee_msat / 1000 if opening_fee_msat is not None else 0
        print("A setup fee of ", opening_fee_sat, " sats is applied to this invoice.")
        # ANCHOR_END: get-fee-info-after-invoice-created
    except Exception as error:
        print(error)
        raise