import breez_sdk

def generate_receive_onchain_address(sdk_services):
  try: 
    # ANCHOR: generate-receive-onchain-address
    swap_info = sdk_services.receive_onchain(
        req=breez_sdk.ReceiveOnchainRequest())

    # Send your funds to the below bitcoin address
    address = swap_info.bitcoin_address
    print("Minimum amount allowed to deposit in sats:", swap_info.min_allowed_deposit)
    print("Maximum amount allowed to deposit in sats:", swap_info.max_allowed_deposit)
    # ANCHOR_END: generate-receive-onchain-address
  except Exception as error:
        print(error)
        raise
  
def get_in_progress_swap(sdk_services):
  try:
      # ANCHOR: in-progress-swap
      swap_info = sdk_services.in_progress_swap()
      # ANCHOR_END: in-progress-swap
  except Exception as error:
      print(error)
      raise
     
    
def list_refundables(sdk_services):
    try:
        # ANCHOR: list-refundables
        refundables = sdk_services.list_refundables()
        # ANCHOR_END: list-refundables
        return refundables
    except Exception as error:
        print(error)
        raise


def execute_refund(sdk_services, refundable):
    if refundable is breez_sdk.SwapInfo:
        # ANCHOR: execute-refund
        destination_address = "..."
        sat_per_vbyte = 5
        try:
            req = breez_sdk.RefundRequest(
                swap_address=refundable.bitcoin_address,
                to_address=destination_address,
                sat_per_vbyte=sat_per_vbyte)
            result = sdk_services.refund(req=req)
        # ANCHOR_END: execute-refund
        except Exception as error:
            print(error)
            raise


def get_channel_opening_fees(sdk_services, amount_msat=None):
   try:
    # ANCHOR: get-channel-opening-fees
    req = breez_sdk.OpenChannelFeeRequest(amount_msat=amount_msat)
    channel_fees = sdk_services.open_channel_fee(req=req)
    # ANCHOR_END: get-channel-opening-fees
    return channel_fees
   except Exception as error:
       print(error)
       raise


def rescan_swaps(sdk_services):
    try:
        # ANCHOR: rescan-swaps
        sdk_services.rescan_swaps()
        # ANCHOR_END: rescan-swaps        
    except Exception as error:
        print(error)
        raise