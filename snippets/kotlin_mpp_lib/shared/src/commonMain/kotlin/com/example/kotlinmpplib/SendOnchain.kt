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

    fun max_reverse_swap_amount(sdk: BlockingBreezServices) {
        // ANCHOR: max-reverse-swap-amount
        try {
            val maxAmount = sdk.maxReverseSwapAmount()
            // Log.v("Breez", "Max reverse swap amount: ${maxAmount.totalSat}")
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: max-reverse-swap-amount
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