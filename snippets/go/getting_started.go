package example

import (
    "log"

    "github.com/breez/breez-sdk-go/breez_sdk"
)

// ANCHOR: init-sdk
// SDK events listener
type BreezListener struct{}

func (BreezListener) OnEvent(e breez_sdk.BreezEvent) {
    log.Printf("received event %#v", e)
}

func GettingStarted() {
    // Create the default config
    seed, err := breez_sdk.MnemonicToSeed("<mnemonic words>")
    if err != nil {
        log.Fatalf("MnemonicToSeed failed: %#v", err)
    }

    inviteCode := "<invite code>"
    apiKey := "<api key>"
    nodeConfig := breez_sdk.NodeConfigGreenlight{
        Config: breez_sdk.GreenlightNodeConfig{
            PartnerCredentials: nil,
            InviteCode:         &inviteCode,
        },
    }

    config := breez_sdk.DefaultConfig(breez_sdk.EnvironmentTypeProduction, apiKey, nodeConfig)
    // Customize the config object according to your needs
    config.WorkingDir = "path to an existing directory"

    sdk, err := breez_sdk.Connect(config, seed, BreezListener{})
    if err != nil {
        log.Fatalf("Connect failed: %#v", err)
    }
}

// ANCHOR_END: init-sdk
func FetchBalance() {
    // ANCHOR: fetch-balance
    if nodeInfo, err := sdk.NodeInfo(); err != nil {
        lnBalance := nodeInfo.ChannelsBalanceMsat
        onchainBalance := nodeInfo.OnchainBalanceMsat

        log.Printf("%#v %#v", lnBalance, onchainBalance)
    }
    // ANCHOR_END: fetch-balance
}
