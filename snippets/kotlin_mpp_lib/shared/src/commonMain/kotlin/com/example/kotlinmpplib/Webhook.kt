package com.example.kotlinmpplib

import breez_sdk.*
class Webhooks {
    fun registerWebhook(sdk: BlockingBreezServices) {
        // ANCHOR: register-webook
        try {
            sdk.registerWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: register-webook
    }

    fun unregisterWebhook(sdk: BlockingBreezServices) {
        // ANCHOR: unregister-webook
        try {
            sdk.unregisterWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: unregister-webook
    }
}