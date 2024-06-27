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

func GettingStarted() *breez_sdk.BlockingBreezServices {
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

	connectRequest := breez_sdk.ConnectRequest{Config: config, Seed: seed}
	sdk, err := breez_sdk.Connect(connectRequest, BreezListener{})
	if err != nil {
		log.Fatalf("Connect failed: %#v", err)
	}

	return sdk
}

// ANCHOR_END: init-sdk

func GettingStartedRestoreOnly(config breez_sdk.Config, seed []uint8) *breez_sdk.BlockingBreezServices {
	// ANCHOR: init-sdk-restore-only
	restoreOnly := true
	connectRequest := breez_sdk.ConnectRequest{
		Config:      config,
		Seed:        seed,
		RestoreOnly: &restoreOnly,
	}
	sdk, err := breez_sdk.Connect(connectRequest, BreezListener{})
	// ANCHOR_END: init-sdk-restore-only
	if err != nil {
		log.Fatalf("Connect failed: %#v", err)
	}
	return sdk
}

func FetchBalance() {
	// ANCHOR: fetch-balance
	if nodeInfo, err := sdk.NodeInfo(); err == nil {
		lnBalance := nodeInfo.ChannelsBalanceMsat
		onchainBalance := nodeInfo.OnchainBalanceMsat

		log.Printf("%#v %#v", lnBalance, onchainBalance)
	}
	// ANCHOR_END: fetch-balance
}

// ANCHOR: logging
type SdkLogStream struct{}

func (SdkLogStream) Log(l breez_sdk.LogEntry) {
	log.Printf("Received log [%v]: %v", l.Level, l.Line)
}

func GettingStartedLogging() {
	err := breez_sdk.SetLogStream(SdkLogStream{})
	if err != nil {
		log.Fatalf("SetLogStream failed: %#v", err)
	}
}

// ANCHOR_END: logging
