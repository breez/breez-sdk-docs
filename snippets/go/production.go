package example

import (
	"github.com/breez/breez-sdk-go/breez_sdk"
)

func ProductionNodeConfig() breez_sdk.NodeConfig {
	// ANCHOR: moving-to-production
	// Read in your Greenlight credentials from the file
	// system, environment variable or build config
	developerKey := []uint8{}
	developerCert := []uint8{}
	greenlightCredentials := breez_sdk.GreenlightCredentials{
		developerKey:  developerKey,
		developerCert: developerCert,
	}

	nodeConfig := breez_sdk.NodeConfigGreenlight{
		Config: breez_sdk.GreenlightNodeConfig{
			PartnerCredentials: &greenlightCredentials,
			InviteCode:         nil,
		},
	}
	// ANCHOR_END: moving-to-production
	return nodeConfig
}
