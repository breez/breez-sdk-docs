package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func PrepareRedeemOnchainFunds(feeRate uint32) {
	// ANCHOR: prepare-redeem-onchain-funds
	satPerVbyte := feeRate
	destinationAddress := "bc1.."
	req := breez_sdk.PrepareRedeemOnchainFundsRequest{SatPerVbyte: satPerVbyte, ToAddress: destinationAddress}
	if prepareRedeemOnchainFundsResponse, err := sdk.PrepareRedeemOnchainFunds(req); err == nil {
		log.Printf("PrepareRedeemOnchainFundsRequest is %#v", prepareRedeemOnchainFundsResponse)
	}
	// ANCHOR_END: prepare-redeem-onchain-funds
}

func RedeemOnchainFunds(satPerVbyte uint32, toAddress string) {
	// ANCHOR: redeem-onchain-funds
	req := breez_sdk.RedeemOnchainFundsRequest{SatPerVbyte: satPerVbyte, ToAddress: toAddress}
	if redeemOnchainFundsResponse, err := sdk.RedeemOnchainFunds(req); err == nil {
		log.Printf("RedeemOnchainFunds error %#v", redeemOnchainFundsResponse)
	}
	// ANCHOR_END: redeem-onchain-funds
}
