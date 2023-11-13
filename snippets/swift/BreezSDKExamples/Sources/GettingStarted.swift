//
//  GettingStarted.swift
//  
//
//  Created by ruben on 13/11/2023.
//

import BreezSDK

// ANCHOR: init-sdk
// SDK events listener
class SDKListener: EventListener {
  func onEvent(e: BreezEvent) {
    print("received event ", e)
  }
}

func gettingStarted() throws -> BlockingBreezServices?{
    // Create the default config
    var sdk: BlockingBreezServices?
    let seed = try? mnemonicToSeed(phrase: "<mnemonic words>")
    
    let inviteCode = "<invite code>"
    let apiKey = "<api key>"
    var config = defaultConfig(envType: EnvironmentType.production, apiKey: apiKey,
        nodeConfig: NodeConfig.greenlight(
            config: GreenlightNodeConfig(partnerCredentials: nil, inviteCode: inviteCode)))

    // Customize the config object according to your needs
    config.workingDir = "path to an existing directory"

    do {
        // Connect to the Breez SDK make it ready for use
        let sdk = try connect(config: config, seed: seed!, listener: SDKListener())
        
    } catch{
        // handle error
    }
    return sdk
}
// ANCHOR_END: init-sdk

func gettingStartedNodeInfo(sdk: BlockingBreezServices) {
    // ANCHOR: fetch-balance
    do {
      let nodeInfo = try sdk.nodeInfo()
        let lnBalance = nodeInfo.channelsBalanceMsat
        let onchainBalance = nodeInfo.onchainBalanceMsat
    } catch {
      // handle error
    }
    // ANCHOR_END: fetch-balance
}


