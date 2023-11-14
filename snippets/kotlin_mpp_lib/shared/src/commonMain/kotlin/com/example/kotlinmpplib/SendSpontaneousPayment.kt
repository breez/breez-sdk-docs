package com.example.kotlinmpplib

import breez_sdk.*
class SendSpontaneousPayment {
    fun send_spontaneous_payment(sdk: BlockingBreezServices) {
        // ANCHOR: send-spontaneous-payment
        val nodeId = "..."
        val amountMsat = 3_000_000.toULong()
        try {
            val response = sdk.sendSpontaneousPayment(
                SendSpontaneousPaymentRequest(nodeId, amountMsat))
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: send-spontaneous-payment
    }
}