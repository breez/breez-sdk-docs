//
//  Production.swift
//
//
//  Created by dangeross on 29/11/2023.
//

import BreezSDK

func productionNodeConfig() -> NodeConfig {
    // ANCHOR: moving-to-production
    // Read in your Greenlight credentials from the file 
    // system, environment variable or build config
    let developerKey = [UInt8]()
    let developerCert = [UInt8]()
    let greenlightCredentials = GreenlightCredentials(developerKey: developerKey, developerCert: developerCert)

    let nodeConfig = NodeConfig.greenlight(
        config: GreenlightNodeConfig(partnerCredentials: greenlightCredentials, inviteCode: nil))
    // ANCHOR_END: moving-to-production
    return nodeConfig
}
