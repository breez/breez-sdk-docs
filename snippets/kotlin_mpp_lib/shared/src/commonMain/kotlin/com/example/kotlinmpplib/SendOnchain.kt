package com.example.kotlinmpplib

import breez_sdk.*
class SendOnchain {
    fun estimate_current_rev_swap_fees(sdk: BlockingBreezServices) {
        // ANCHOR: estimate-current-reverse-swap-total-fees
        try {
            val fees = sdk.fetchReverseSwapFees(ReverseSwapFeesRequest(50_000_u))
            // Log.v("Breez", "Total estimated fees for reverse swap: ${fees.totalEstimatedFees}")
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: estimate-current-reverse-swap-total-fees
    }

    fun get_current_rev_swap_min_max(sdk: BlockingBreezServices, fees: ReverseSwapPairInfo) {
        // ANCHOR: get-current-reverse-swap-min-max
        // Log.v("Breez", "Minimum amount, in sats: ${fees.min}")
        // Log.v("Breez", "Maximum amount, in sats: ${fees.max}")
        // ANCHOR_END: get-current-reverse-swap-min-max
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