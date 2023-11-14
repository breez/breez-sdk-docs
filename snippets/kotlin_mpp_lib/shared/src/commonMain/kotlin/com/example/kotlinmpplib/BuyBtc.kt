package com.example.kotlinmpplib

import breez_sdk.*

class BuyBtc {
    fun buy_btc(sdk: BlockingBreezServices) {
        // ANCHOR: buy-btc
        try {
            // Choose your provider
            val provider = BuyBitcoinProvider.MOONPAY
            // request the url to proceed with the Bitcoin acquisition
            val url = sdk.buyBitcoin(BuyBitcoinRequest(provider)).url
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: buy-btc
    }
}