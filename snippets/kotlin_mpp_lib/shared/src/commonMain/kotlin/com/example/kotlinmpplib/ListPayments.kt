package com.example.kotlinmpplib

import breez_sdk.*
class ListPayments {
    fun list_payments(sdk: BlockingBreezServices) {
        // ANCHOR: list-payments
        try {
            val payments = sdk.listPayments(ListPaymentsRequest())
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: list-payments
    }

    fun list_payments_filtered(sdk: BlockingBreezServices) {
        // ANCHOR: list-payments-filtered
        try {
            val payments = sdk.listPayments(
                ListPaymentsRequest(
                    listOf(PaymentTypeFilter.SENT),
                    fromTimestamp = 1696880000,
                    includeFailures = true
                ))
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: list-payments-filtered
    }
}