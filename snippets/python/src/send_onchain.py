import breez_sdk

def get_current_limits(sdk_services):
    try: 
        # ANCHOR: get-current-reverse-swap-limits
        current_limits = sdk_services.onchain_payment_limits()
        print("Minimum amount, in sats: ", current_limits.min_sat)
        print("Maximum amount, in sats: ", current_limits.max_sat)
        # ANCHOR_END: get-current-reverse-swap-limits
        return current_fees
    except Exception as error:
        print(error)
        raise

def max_reverse_swap_amount(sdk_services):
    try: 
        # ANCHOR: max-reverse-swap-amount     
        max_amount = sdk_services.max_reverse_swap_amount()
        print("Max reverse swap amount: ", max_amount.totalSat)
        # ANCHOR_END: max-reverse-swap-amount
        return max_amount
    except Exception as error:
        print(error)
        raise

def prepare_pay_onchain(sdk_services, current_limits, fee_rate):
    amount_sat = current_limits.min_sat
    claim_tx_feerate = fee_rate
    try:
        # ANCHOR: prepare-pay-onchain
        req = breez_sdk.PrepareOnchainPaymentRequest(amount_sat, breez_sdk.SwapAmountType.SEND, claim_tx_feerate)
        resp = sdk_services.prepare_onchain_payment(req)

        print("Send amount, in sats: ", resp.sender_amount_sat)
        print("Receive amount, in sats: ", resp.recipient_amount_sat)
        print("Total fees, in sats: ", resp.total_fees)
    # ANCHOR_END: prepare-pay-onchain
    except Exception as error:
        print(error)
        raise

def start_reverse_swap(sdk_services, current_fees,fee_rate):
    # ANCHOR: start-reverse-swap
    destination_address = "bc1.."
    amount_sat = 50000
    sat_per_vbyte = fee_rate
    try:
        req = breez_sdk.SendOnchainRequest(amount_sat, destination_address, current_fees.fees_hash, sat_per_vbyte)
        sdk_services.send_onchain(req)
    # ANCHOR_END: start-reverse-swap
    except Exception as error:
        print(error)
        raise

def check_reverse_swap_status(sdk_services):
    try: 
        # ANCHOR: check-reverse-swaps-status
        reverse_swaps = sdk_services.in_progress_reverse_swaps()
        for rs in reverse_swaps:
            print("Reverse swap ",rs.id , " in progress, status is ", rs.status)
        # ANCHOR_END: check-reverse-swaps-status
    except Exception as error:
        print(error)
        raise
    