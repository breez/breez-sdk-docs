import breez_sdk
import logging

sdk_services = breez_sdk.BlockingBreezServices

def generate_receive_onchain_address():
  try: 
    # ANCHOR: generate-receive-onchain-address
    swap_info = sdk_services.receive_onchain(breez_sdk.ReceiveOnchainRequest())

    # Send your funds to the below bitcoin address
    address = swap_info.bitcoin_address
    # ANCHOR_END: generate-receive-onchain-address
  except Exception as error:
        logging.error(error)
        raise
  
  def get_in_progress_swap():
    try:
       # ANCHOR: in-progress-swap
       swap_info = sdk_services.in_progress_swap()
       # ANCHOR_END: in-progress-swap
    except Exception as error:
        logging.error(error)
        raise
     
    
def list_refundables():
    try:
        # ANCHOR: list-refundables
        refundables = sdk_services.list_refundables()
        # ANCHOR_END: list-refundables
    except Exception as error:
        logging.error(error)
        raise

def execute_refund(refundable):
   if refundable is breez_sdk.SwapInfo:
    # ANCHOR: execute-refund
    destination_address = "..."
    
    sat_per_vbyte = 5
    try:
        result = sdk_services.refund(
           swap_address=refundable.bitcoin_address,                         
           to_address=destination_address,
           sat_per_vbyte=sat_per_vbyte)
    # ANCHOR_END: execute-refund
    except Exception as error:
       logging.error(error)
       raise

def get_channel_opening_fees(amount_msat,):
   try:
    # ANCHOR: get-channel-opening-fees
    req = breez_sdk.OpenChannelFeeRequest(amount_msat)
    channel_fees = sdk_services.open_channel_fee(req)
    # ANCHOR_END: get-channel-opening-fees
    return channel_fees
   except Exception as error:
       logging.error(error)
       raise