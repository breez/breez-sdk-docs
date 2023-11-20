import breez_sdk

def get_current_fees(sdk_services):
    try: 
        # ANCHOR: estimate-current-reverse-swap-total-fees
        req = breez_sdk.ReverseSwapFeesRequest(send_amount_sat=50000)
        current_fees = sdk_services.fetch_reverse_swap_fees(req)
        print("Total estimated fees for reverseswap: ", current_fees)
        # ANCHOR_END: estimate-current-reverse-swap-total-fees
        return current_fees
    except Exception as error:
        print(error)
        raise

def list_current_fees(current_fees):
    # ANCHOR: get-current-reverse-swap-min-max
    print("Minimum amount, in sats: ", current_fees.min)
    print("Maximum amount, in sats: ", current_fees.max)
    # ANCHOR_END: get-current-reverse-swap-min-max

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
    