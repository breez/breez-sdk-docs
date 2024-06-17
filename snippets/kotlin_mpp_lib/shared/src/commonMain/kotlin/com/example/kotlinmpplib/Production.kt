package com.example.kotlinmpplib

import breez_sdk.*
class Production {
    fun productionNodeConfig(): NodeConfig {
        // ANCHOR: moving-to-production
        // Read in your Greenlight credentials from the file 
        // system, environment variable or build config
        val deviceKey = emptyList<UByte>()
        val deviceCert = emptyList<UByte>()
        val greenlightCredentials = GreenlightCredentials(deviceKey, deviceCert)

        val nodeConfig = NodeConfig.Greenlight(GreenlightNodeConfig(greenlightCredentials, null))
        // ANCHOR_END: moving-to-production
        return nodeConfig
    }
}