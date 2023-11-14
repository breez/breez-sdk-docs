package com.example.kotlinmpplib

import breez_sdk.*
class ConnectingLsp {
    fun get_lsp_info(sdk: BlockingBreezServices) {
        // ANCHOR: get-lsp-info
        try {
            val lspId = sdk.lspId()
            if (lspId != null) {
                val lspInfo = sdk.lspInfo()
            } else {
                // Handle no lsp id scenario
            }
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: get-lsp-info
    }

    fun connect_lsp(sdk: BlockingBreezServices, lspId: String) {
        // ANCHOR: connect-lsp
        try {
            sdk.connectLsp(lspId)
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: connect-lsp
    }
}