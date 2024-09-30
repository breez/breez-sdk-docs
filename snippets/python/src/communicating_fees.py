import breez_sdk

def get_fee_info_before_receiving_payment(sdk_services):
    try:
        # ANCHOR: get-fee-info-before-receiving-payment
        inbound_liquidity_msat = sdk_services.node_info().max_receivable_single_payment_amount_msat
        inbound_liquidity_sat = inbound_liquidity_msat / 1_000

        opening_fee_response = sdk_services.open_channel_fee()

        opening_fees = opening_fee_response.fee_params
        fee_percentage = (opening_fees.proportional * 100)  / 1_000_000
        min_fee_sat = opening_fees.min_msat / 1_000

        if inbound_liquidity_sat == 0:
            print("A setup fee of ", fee_percentage, "% with a minimum of ", min_fee_sat, " sats will be applied.")
        else:
            print(
                "A setup fee of ", fee_percentage, "% with a minimum of ", min_fee_sat, " sats will be applied "
                "for receiving more than ", inbound_liquidity_sat, " sats."
            )
        # ANCHOR_END: get-fee-info-before-receiving-payment
    except Exception as error:
        print(error)
        raise

def get_fee_info_after_invoice_created(receive_payment_response):
    try:
        # ANCHOR: get-fee-info-after-invoice-created
        opening_fee_msat = receive_payment_response.opening_fee_msat
        opening_fee_sat = opening_fee_msat / 1_000 if opening_fee_msat is not None else 0
        print("A setup fee of ", opening_fee_sat, " sats is applied to this invoice.")
        # ANCHOR_END: get-fee-info-after-invoice-created
    except Exception as error:
        print(error)
        raise


def get_fee_info_receive_onchain(sdk_services):
    try:
        # ANCHOR: get-fee-info-receive-onchain
        swap_info = sdk_services.receive_onchain(breez_sdk.ReceiveOnchainRequest())

        min_deposit_sat = swap_info.min_allowed_deposit
        max_deposit_sat = swap_info.max_allowed_deposit
        inbound_liquidity_sat = sdk_services.node_info().max_receivable_single_payment_amount_msat / 1_000

        swap_opening_fees = swap_info.channel_opening_fees
        if swap_opening_fees is not None:
            fee_percentage = (swap_opening_fees.proportional * 100)  / 1_000_000
            min_fee_sat = swap_opening_fees.min_msat / 1_000

            print(
                "Send more than ", min_deposit_sat, " sats and up to ", max_deposit_sat, " sats to this address. "
                "A setup fee of ", fee_percentage, "% with a minimum of ", min_fee_sat, " sats will be applied for "
                "sending more than ", inbound_liquidity_sat, " sats. This address can only be used once."
            )
        # ANCHOR_END: get-fee-info-receive-onchain
    except Exception as error:
        print(error)
        raise
