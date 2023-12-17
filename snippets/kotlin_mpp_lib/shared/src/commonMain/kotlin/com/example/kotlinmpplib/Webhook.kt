package com.example.kotlinmpplib

import breez_sdk.*
class Webhooks {
    fun Webhook(sdk: BlockingBreezServices) {
        // ANCHOR: register-webook
        try {
            sdk.registerWebhook("https://yourapplication.com")
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: register-webook
    }

    fun paymentWebhook(sdk: BlockingBreezServices) {
        // ANCHOR: register-payment-webook
        try {
            sdk.registerWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: register-payment-webook
    }
}