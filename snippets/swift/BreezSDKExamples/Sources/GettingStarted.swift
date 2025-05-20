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

func gettingStarted() throws -> BlockingBreezServices? {
    // Create the default config
    let seed = try? mnemonicToSeed(phrase: "<mnemonic words>")

    let inviteCode = "<invite code>"
    let apiKey = "<api key>"
    var config = defaultConfig(envType: EnvironmentType.production, apiKey: apiKey,
                               nodeConfig: NodeConfig.greenlight(
                                   config: GreenlightNodeConfig(partnerCredentials: nil, inviteCode: inviteCode)))

    // Customize the config object according to your needs
    config.workingDir = "path to an existing directory"

    // Connect to the Breez SDK make it ready for use
    guard seed != nil else {
        return nil
    }
    let connectRequest = ConnectRequest(config: config, seed: seed!)
    let sdk = try? connect(req: connectRequest, listener: SDKListener())

    return sdk
}
// ANCHOR_END: init-sdk

func gettingStartedRestoreOnly(config: Config, seed: [UInt8]) throws -> BlockingBreezServices? {
    // ANCHOR: init-sdk-restore-only
    let connectRequest = ConnectRequest(config: config, seed: seed, restoreOnly: true)
    let sdk = try? connect(req: connectRequest, listener: SDKListener())
    // ANCHOR_END: init-sdk-restore-only
    return sdk
}

func gettingStartedNodeInfo(sdk: BlockingBreezServices) {
    // ANCHOR: fetch-balance
    if let nodeInfo = try? sdk.nodeInfo() {
        let lnBalance = nodeInfo.channelsBalanceMsat
        let onchainBalance = nodeInfo.onchainBalanceMsat
        print(lnBalance);
        print(onchainBalance);
    }
    // ANCHOR_END: fetch-balance
}

// ANCHOR: logging
class SDKLogStream: LogStream {
    func log(l: LogEntry) {
        print("Received log [", l.level, "]: ", l.line)
    }
}

func logging() throws {
    try? setLogStream(logStream: SDKLogStream())
}
// ANCHOR_END: logging

// ANCHOR: disconnect
func disconnect(sdk: BlockingBreezServices) throws {
    try? sdk.disconnect()
}
// ANCHOR_END: disconnect
