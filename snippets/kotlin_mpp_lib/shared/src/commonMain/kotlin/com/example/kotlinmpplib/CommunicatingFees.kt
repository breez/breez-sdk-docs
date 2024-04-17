package com.example.kotlinmpplib

import breez_sdk.*
class CommunicatingFees {
    fun get_fee_info_after_invoice_created(receivePaymentResponse: ReceivePaymentResponse) {
        // ANCHOR: get-fee-info-after-invoice-created
        val openingFeeSat = receivePaymentResponse.openingFeeMsat?.let{ it.div(1000).toULong() } ?: run { 0UL }
        // Log.v("Breez", "A setup fee of ${openingFeeSat} sats is applied to this invoice.")
        // ANCHOR_END: get-fee-info-after-invoice-created
    }
}