package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func getFeeInfoBeforeInvoiceCreated() error {
	// ANCHOR: get-fee-info-before-receiving-payment
	nodeInfo, err := sdk.NodeInfo()
	if err != nil {
		return err
	}
	var inboundLiquiditySat = nodeInfo.MaxReceivableSinglePaymentAmountMsat / 1_000

	openingFeeResponse, err := sdk.OpenChannelFee(breez_sdk.OpenChannelFeeRequest{})
	if err != nil {
		return err
	}
	var openingFees = openingFeeResponse.FeeParams
	var feePercentage = (openingFees.Proportional * 100) / 1_000_000.0
	var minFeeSat = openingFees.MinMsat / 1_000

	if inboundLiquiditySat == 0 {
		log.Printf(
			"A setup fee of %v%% with a minimum of %v sats will be applied.",
			feePercentage, minFeeSat)
	} else {
		log.Printf(
			"A setup fee of %v%% with a minimum of %v sats will be applied"+
				"for receiving more than %v sats.",
			feePercentage, minFeeSat, inboundLiquiditySat)
	}
	// ANCHOR_END: get-fee-info-before-receiving-payment
	return nil
}

func GetFeeInfoAfterInvoiceCreated(receivePaymentResponse breez_sdk.ReceivePaymentResponse) error {
	// ANCHOR: get-fee-info-after-invoice-created
	var openingFeeSat int
	openingFeeMsat := receivePaymentResponse.OpeningFeeMsat
	if openingFeeMsat != nil {
		openingFeeSat = int(*openingFeeMsat / 1_000)
	}
	log.Printf("A setup fee of %v sats is applied to this invoice.", openingFeeSat)
	// ANCHOR_END: get-fee-info-after-invoice-created
	return nil
}

func getFeeInfoReceiveOnchain() error {
	// ANCHOR: get-fee-info-receive-onchain
	swapInfo, err := sdk.ReceiveOnchain(breez_sdk.ReceiveOnchainRequest{})
	if err != nil {
		return err
	}
	var minDepositSat = swapInfo.MinAllowedDeposit
	var maxDepositSat = swapInfo.MaxAllowedDeposit

	nodeInfo, err := sdk.NodeInfo()
	if err != nil {
		return err
	}
	var inboundLiquiditySat = nodeInfo.MaxReceivableSinglePaymentAmountMsat / 1_000

	var swapOpeningFees = swapInfo.ChannelOpeningFees
	var feePercentage = (swapOpeningFees.Proportional * 100) / 1_000_000.0
	var minFeeSat = swapOpeningFees.MinMsat / 1_000

	log.Printf(
		"Send more than %v sats and up to %v sats to this address. "+
			"A setup fee of %v%% with a minimum of %v sats will be applied "+
			"for sending more than %v sats. This address can only be used once.",
		minDepositSat, maxDepositSat, feePercentage, minFeeSat, inboundLiquiditySat)
	// ANCHOR_END: get-fee-info-receive-onchain
	return nil
}
