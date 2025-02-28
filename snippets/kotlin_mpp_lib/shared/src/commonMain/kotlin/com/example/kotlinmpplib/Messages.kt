package com.example.kotlinmpplib

import breez_sdk.*

class Messages {
    fun signMessage(sdk: BlockingBreezServices) {
        // ANCHOR: sign-message
        val message = "<message to sign>"
        try {
            val signMessageRequest = SignMessageRequest(message)
            val signMessageResponse = sdk.signMessage(signMessageRequest)

            // Get the node info for your pubkey
            val info = sdk.nodeInfo()

            val signature = signMessageResponse?.signature
            val pubkey = info?.id

            // Log.v("Breez", "Pubkey: ${pubkey}")
            // Log.v("Breez", "Signature: ${signature}")
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: sign-message
    }

    fun checkMessage(sdk: BlockingBreezServices) {
        // ANCHOR: check-message
        val message = "<message>"
        val pubkey = "<pubkey of signer>"
        val signature = "<message signature>"
        try {
            val checkMessageRequest = CheckMessageRequest(message, pubkey, signature)
            val checkMessageResponse = sdk.checkMessage(checkMessageRequest)

            val isValid = checkMessageResponse?.isValid

            // Log.v("Breez", "Signature valid: ${isValid}")
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: check-message
    }

}
