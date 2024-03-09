package com.example.kotlinmpplib

import breez_sdk.*
class GettingStarted {
    fun start() {
        // ANCHOR: init-sdk
        // SDK events listener
        class SDKListener : EventListener {
            override fun onEvent(e: BreezEvent) {
                // Log.v("SDKListener", "Received event $e")
            }
        }

        // Select your seed, invite code and eviroment
        val seed = mnemonicToSeed("<mnemonic words>")
        val inviteCode = "<invite code>"
        val apiKey = "<api key>"

        // Create the default config
        val greenlightNodeConfig = GreenlightNodeConfig(null, inviteCode)
        val nodeConfig = NodeConfig.Greenlight(greenlightNodeConfig)
        val config = defaultConfig(EnvironmentType.PRODUCTION, apiKey, nodeConfig)

        // Customize the config object according to your needs
        config.workingDir = "path to an existing directory"

        try {
            // Connect to the Breez SDK make it ready for use
            val sdk = connect(ConnectRequest(config, seed), SDKListener())
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: init-sdk
    }

    fun fetch_balance(sdk: BlockingBreezServices) {
        // ANCHOR: fetch-balance
        try {
            val nodeInfo = sdk.nodeInfo()
            val lnBalance = nodeInfo?.channelsBalanceMsat
            val onchainBalance = nodeInfo?.onchainBalanceMsat
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: fetch-balance
    }
}