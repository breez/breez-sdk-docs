package com.example.kotlinmpplib

import breez_sdk.*
class ConnectingLsp {
    fun getLspInfo(sdk: BlockingBreezServices) {
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

    fun listLsps(sdk: BlockingBreezServices) {
        // ANCHOR: list-lsps
        try {
            val availableLsps = sdk.listLsps()
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: list-lsps
    }
    fun connectLsp(sdk: BlockingBreezServices, lspId: String) {
        // ANCHOR: connect-lsp
        try {
            sdk.connectLsp(lspId)
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: connect-lsp
    }
}