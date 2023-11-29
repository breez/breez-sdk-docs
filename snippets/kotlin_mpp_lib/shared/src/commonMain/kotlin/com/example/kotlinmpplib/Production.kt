package com.example.kotlinmpplib

import breez_sdk.*
class Production {
    fun productionNodeConfig(): NodeConfig {
        // ANCHOR: moving-to-production
        // Read your Greenlight credentials from secure storage
        val deviceKey = emptyList<UByte>()
        val deviceCert = emptyList<UByte>()
        val greenlightCredentials = GreenlightCredentials(deviceKey, deviceCert)

        val nodeConfig = NodeConfig.Greenlight(GreenlightNodeConfig(greenlightCredentials, null))
        // ANCHOR_END: moving-to-production
        return nodeConfig
    }
}