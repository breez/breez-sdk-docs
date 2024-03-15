package com.example.kotlinmpplib

import breez_sdk.*
class SendOnchain {
    fun get_current_rev_swap_limits(sdk: BlockingBreezServices) {
        // ANCHOR: get-current-reverse-swap-limits
        try {
            val currentLimits = sdk.onchainPaymentLimits()
            // Log.v("Breez", "Minimum amount, in sats: ${currentLimits.minSat}")
            // Log.v("Breez", "Maximum amount, in sats: ${currentLimits.maxSat}")
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: get-current-reverse-swap-limits
    }

    fun prepare_pay_onchain(sdk: BlockingBreezServices, currentLimits: OnchainPaymentLimitsResponse) {
        // ANCHOR: prepare-pay-onchain
        val amountSat = currentLimits.minSat
        val satPerVbyte = 10.toUInt()
        try {
            val prepareRequest = PrepareOnchainPaymentRequest(amountSat, SwapAmountType.SEND, satPerVbyte)
            val prepareRes = sdk.prepareOnchainPayment(prepareRequest)
            // Log.v("Breez", "Sender amount: ${prepareRes.senderAmountSat} sats")
            // Log.v("Breez", "Recipient amount: ${prepareRes.recipientAmountSat} sats")
            // Log.v("Breez", "Total fees: ${prepareRes.totalFees} sats")
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: prepare-pay-onchain
    }

    fun start_reverse_swap(sdk: BlockingBreezServices, fees: ReverseSwapPairInfo) {
        // ANCHOR: start-reverse-swap
        val address = "bc1.."
        val amountSat = 123.toULong()
        val satPerVbyte = 1.toUInt()
        try {
            sdk.sendOnchain(SendOnchainRequest(amountSat, address, fees.feesHash, satPerVbyte))
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: start-reverse-swap
    }

    fun check_rev_swap_status(sdk: BlockingBreezServices) {
        // ANCHOR: check-reverse-swaps-status
        for (rs in sdk.inProgressReverseSwaps()) {
            // Log.v("Breez", "Reverse swap ${rs.id} in progress, status is ${rs.status}")
        }
        // ANCHOR_END: check-reverse-swaps-status
    }
}