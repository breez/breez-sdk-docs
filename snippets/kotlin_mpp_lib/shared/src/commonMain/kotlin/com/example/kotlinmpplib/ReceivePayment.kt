package com.example.kotlinmpplib

import breez_sdk.*
class ReceivePayment {
    fun receive_payment(sdk: BlockingBreezServices) {
        // ANCHOR: receive-payment
        try {
            val invoice = sdk.receivePayment(ReceivePaymentRequest(
                3_000_000.toULong(),
                "Invoice for 3000 sats",
            ))
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: receive-payment
    }
}