package com.example.kotlinmpplib

import breez_sdk.*
class ClosedChannel {
    fun prepareRedeemOnchainFunds(sdk: BlockingBreezServices, feeRate: UInt) {
        // ANCHOR: prepare-redeem-onchain-funds 
         val satPerVbyte = feeRate
         var destinationAddress = "bc1.."
         try {
            val req = PrepareRedeemOnchainFundsRequest(destinationAddress, satPerVbyte)
            val prepareRedeemOnchainFundsResp = sdk.prepareRedeemOnchainFunds(req)
         }
         catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: prepare-redeem-onchain-funds 
    }

    fun redeemOnchainFunds(sdk: BlockingBreezServices, satPerVbyte: UInt, toAddress: String) {
        // ANCHOR: redeem-onchain-funds 
         try {
            val req = RedeemOnchainFundsRequest(toAddress, satPerVbyte)
            val redeemOnchainFundsResp = sdk.redeemOnchainFunds(req)
         }
         catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: redeem-onchain-funds
    }
}