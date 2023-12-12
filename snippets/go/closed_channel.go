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
	res, err := sdk.PrepareRedeemOnchainFunds(req)
	if err != nil {
		log.Printf("PrepareRedeemOnchainFunds error %#v", err)
	}
	// ANCHOR_END: prepare-redeem-onchain-funds
}

func RedeemOnchainFunds(satPerVbyte uint32, toAddress string) {
	// ANCHOR: redeem-onchain-funds
	req := breez_sdk.RedeemOnchainFundsRequest{SatPerVbyte: satPerVbyte, ToAddress: toAddress}
	res, err := sdk.RedeemOnchainFunds(req)
	if err != nil {
		log.Printf("RedeemOnchainFunds error %#v", err)
	}
	// ANCHOR_END: redeem-onchain-funds
}
