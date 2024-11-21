package com.example.kotlinmpplib

import breez_sdk.*
class SendPayment {
    fun sendPayment(sdk: BlockingBreezServices) {
        // ANCHOR: send-payment
        val bolt11 = "..."
        try {
            val useTrampoline = true
            // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
            // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
            val optionalAmountMsat = 3_000_000.toULong()
            val optionalLabel = "<label>"
            val req = SendPaymentRequest(bolt11, useTrampoline, optionalAmountMsat, optionalLabel)
            val response = sdk.sendPayment(req)
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: send-payment
    }
}