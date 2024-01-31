//
//  Production.swift
//
//
//  Created by dangeross on 29/11/2023.
//

import BreezSDK

func productionNodeConfig() -> NodeConfig {
    // ANCHOR: moving-to-production
    // Read your Greenlight credentials from secure storage
    let deviceKey = [UInt8]()
    let deviceCert = [UInt8]()
    let greenlightCredentials = GreenlightCredentials(deviceKey: deviceKey, deviceCert: deviceCert)

    let nodeConfig = NodeConfig.greenlight(
        config: GreenlightNodeConfig(partnerCredentials: greenlightCredentials, inviteCode: nil))
    // ANCHOR_END: moving-to-production
    return nodeConfig
}
