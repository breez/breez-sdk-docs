package com.example.kotlinmpplib

import breez_sdk.*
class SendSpontaneousPayment {
    fun sendSpontaneousPayment(sdk: BlockingBreezServices) {
        // ANCHOR: send-spontaneous-payment
        val nodeId = "..."
        val amountMsat = 3_000_000.toULong()
        val optionalLabel = "<label>"
        try {
            val req = SendSpontaneousPaymentRequest(nodeId, amountMsat, label = optionalLabel)
            val response = sdk.sendSpontaneousPayment(req)
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: send-spontaneous-payment
    }

    fun sendSpontaneousPaymentWithTlvs(sdk: BlockingBreezServices) {
        // ANCHOR: send-spontaneous-payment-with-tlvs
        val nodeId = "..."
        val amountMsat = 3_000_000.toULong()
        val optionalExtraTlvs = listOf<TlvEntry>(
            TlvEntry(34_349_334.toULong(), "Hello world!".encodeToByteArray().asUByteArray().toList())
        )
        try {
            val req = SendSpontaneousPaymentRequest(nodeId, amountMsat, optionalExtraTlvs)
            val response = sdk.sendSpontaneousPayment(req)
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: send-spontaneous-payment-with-tlvs
    }
}