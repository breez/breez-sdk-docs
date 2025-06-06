package com.example.kotlinmpplib

import breez_sdk.*
class Webhooks {
    fun registerWebhook(sdk: BlockingBreezServices) {
        // ANCHOR: register-webook
        try {
            val url = "https://your-nds-service.com/api/v1/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
            sdk.registerWebhook(url)
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: register-webook
    }

    fun unregisterWebhook(sdk: BlockingBreezServices) {
        // ANCHOR: unregister-webook
        try {
            val url = "https://your-nds-service.com/api/v1/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
            sdk.unregisterWebhook(url)
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: unregister-webook
    }
}