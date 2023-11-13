import logging
import breez_sdk




def buy(sdk_services):
    try:
        # ANCHOR: buy-btc
        req =  breez_sdk.BuyBitcoinRequest(breez_sdk.BuyBitcoinProvider.MOONPAY)
        buy_bitcoin_resp = sdk_services.buy_bitcoin(req=req)
        # ANCHOR_END: buy-btc
    except Exception as error:
        logging.error(error)
        raise
