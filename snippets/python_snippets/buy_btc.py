from breez_sdk import BlockingBreezServices
import logging
import breez_sdk

sdk_services = BlockingBreezServices


try:
    # ANCHOR: buy-btc
   req =  breez_sdk.BuyBitcoinRequest(breez_sdk.BuyBitcoinProvider.MOONPAY)
   buy_bitcoin_resp = sdk_services.buy_bitcoin(req)
    # ANCHOR_END: buy-btc
except Exception as error:
    logging.error(error)
    raise
