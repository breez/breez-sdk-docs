package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func GetCurrentLimits() {
	// ANCHOR: get-current-reverse-swap-limits
	currentLimits, err := sdk.OnchainPaymentLimits()
	if err != nil {
		return err
	}

	log.Printf("Minimum amount, in sats: %v", currentLimits.MinSat)
	log.Printf("Maximum amount, in sats: %v", currentLimits.MaxSat)
	// ANCHOR_END: get-current-reverse-swap-limits
}

func PreparePayOnchain(currentLimits breez_sdk.OnchainPaymentLimitsResponse) {
	// ANCHOR: prepare-pay-onchain
	sendAmountSat := currentLimits.MinSat
	satPerVbyte := uint32(10)

	req := breez_sdk.PrepareOnchainPaymentRequest{
		AmountSat:      sendAmountSat,
		AmountType:     breez_sdk.SwapAmountTypeSend,
		ClaimTxFeerate: satPerVbyte,
	}

	prepareRes, err := sdk.PrepareOnchainPayment(req)
	if err != nil {
		return err
	}

	log.Printf("Sender amount, in sats: %v", prepareRes.SenderAmountSat)
	log.Printf("Recipient amount, in sats: %v", prepareRes.RecipientAmountSat)
	log.Printf("Total fees, in sats: %v", prepareRes.TotalFees)
	// ANCHOR_END: prepare-pay-onchain
}

func StartReverseSwap(prepareRes breez_sdk.PrepareOnchainPaymentResponse) {
	// ANCHOR: start-reverse-swap
	destinationAddress := "bc1.."

	payOnchainRequest := breez_sdk.PayOnchainRequest{
		RecipientAddress: destinationAddress,
		PrepareRes:       prepareRes,
	}

	reverseSwapInfo, err := sdk.PayOnchain(payOnchainRequest)
	if err != nil {
		return err
	}

	log.Printf("%#v", reverseSwapInfo)
	// ANCHOR_END: start-reverse-swap
}

func CheckReverseSwapStatus() {
	// ANCHOR: check-reverse-swaps-status
	swaps, err := sdk.InProgressOnchainPayments()
	if err != nil {
		return err
	}

	for _, swap := range swaps {
		log.Printf("Onchain payment %v in progress, status is %v", swap.Id, swap.Status)
	}
	// ANCHOR_END: check-reverse-swaps-status
}
