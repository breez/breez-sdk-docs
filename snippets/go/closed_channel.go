package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func PrepareRedeemOnchainFunds(feeRate uint32) error {
	// ANCHOR: prepare-redeem-onchain-funds
	satPerVbyte := feeRate
	destinationAddress := "bc1.."
	req := breez_sdk.PrepareRedeemOnchainFundsRequest{SatPerVbyte: satPerVbyte, ToAddress: destinationAddress}
	prepareRedeemOnchainFundsResponse, err := sdk.PrepareRedeemOnchainFunds(req)
	if err != nil {
		return err
	}
	log.Printf("PrepareRedeemOnchainFundsRequest is %#v", prepareRedeemOnchainFundsResponse)
	// ANCHOR_END: prepare-redeem-onchain-funds
	return nil
}

func RedeemOnchainFunds(satPerVbyte uint32, toAddress string) error {
	// ANCHOR: redeem-onchain-funds
	req := breez_sdk.RedeemOnchainFundsRequest{SatPerVbyte: satPerVbyte, ToAddress: toAddress}
	redeemOnchainFundsResponse, err := sdk.RedeemOnchainFunds(req)
	if err != nil {
		return err
	}
	log.Printf("RedeemOnchainFunds error %#v", redeemOnchainFundsResponse)
	// ANCHOR_END: redeem-onchain-funds
	return nil
}
