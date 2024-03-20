import breez_sdk

def get_current_limits(sdk_services):
    try: 
        # ANCHOR: get-current-reverse-swap-limits
        current_limits = sdk_services.onchain_payment_limits()
        print("Minimum amount, in sats: ", current_limits.min_sat)
        print("Maximum amount, in sats: ", current_limits.max_sat)
        # ANCHOR_END: get-current-reverse-swap-limits
        return current_limits
    except Exception as error:
        print(error)
        raise

def prepare_pay_onchain(sdk_services, current_limits, fee_rate):
    amount_sat = current_limits.min_sat
    claim_tx_feerate = fee_rate
    try:
        # ANCHOR: prepare-pay-onchain
        req = breez_sdk.PrepareOnchainPaymentRequest(amount_sat, breez_sdk.SwapAmountType.SEND, claim_tx_feerate)
        prepare_res = sdk_services.prepare_onchain_payment(req)

        print("Sender amount, in sats: ", prepare_res.sender_amount_sat)
        print("Recipient amount, in sats: ", prepare_res.recipient_amount_sat)
        print("Total fees, in sats: ", prepare_res.total_fees)
    # ANCHOR_END: prepare-pay-onchain
    except Exception as error:
        print(error)
        raise

def start_reverse_swap(sdk_services, prepare_res):
    # ANCHOR: start-reverse-swap
    destination_address = "bc1.."
    try:
        req = breez_sdk.PayOnchainRequest(destination_address, prepare_res)
        sdk_services.pay_onchain(req)
    # ANCHOR_END: start-reverse-swap
    except Exception as error:
        print(error)
        raise

def check_reverse_swap_status(sdk_services):
    try: 
        # ANCHOR: check-reverse-swaps-status
        reverse_swaps = sdk_services.in_progress_onchain_payments()
        for rs in reverse_swaps:
            print("Onchain payment ",rs.id , " in progress, status is ", rs.status)
        # ANCHOR_END: check-reverse-swaps-status
    except Exception as error:
        print(error)
        raise
    