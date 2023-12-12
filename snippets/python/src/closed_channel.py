import breez_sdk

def prepare_redeem_onchain_funds(sdk_services, fee_rate):
   
    try:
         # ANCHOR: prepare-redeem-onchain-funds
        destination_address = "bc1.."
        sat_per_vbyte = fee_rate
        req = breez_sdk.PrepareRedeemOnchainFundsRequest(destination_address, sat_per_vbyte)
        result =  sdk_services.prepare_redeem_onchain_funds(req)
        # ANCHOR_END: prepare-redeem-onchain-funds
        return result
    except Exception as error:
        print(error)
        raise

def redeem_onchain_funds(sdk_services, to_address, fee_rate):
    try:
        # ANCHOR: redeem-onchain-funds
        req = breez_sdk.RedeemOnchainFundsRequest(to_address, fee_rate)
        result = sdk_services.redeem_onchain_funds(req)
        # ANCHOR_END: redeem-onchain-funds
        return result
    except Exception as error:
        print(error)
        raise