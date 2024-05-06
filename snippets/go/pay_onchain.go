package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func GetCurrentLimits() {
	// ANCHOR: get-current-reverse-swap-limits
	if currentLimits, err := sdk.OnchainPaymentLimits(); err == nil {
		log.Printf("Minimum amount, in sats: %v", currentLimits.MinSat)
		log.Printf("Maximum amount, in sats: %v", currentLimits.MaxSat)
	}
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

	if prepareRes, err := sdk.PrepareOnchainPayment(req); err == nil {
		log.Printf("Sender amount, in sats: %v", prepareRes.SenderAmountSat)
		log.Printf("Recipient amount, in sats: %v", prepareRes.RecipientAmountSat)
		log.Printf("Total fees, in sats: %v", prepareRes.TotalFees)
	}
	// ANCHOR_END: prepare-pay-onchain
}

func StartReverseSwap(prepareRes breez_sdk.PrepareOnchainPaymentResponse) {
	// ANCHOR: start-reverse-swap
	destinationAddress := "bc1.."

	payOnchainRequest := breez_sdk.PayOnchainRequest{
		RecipientAddress: destinationAddress,
		PrepareRes:       prepareRes,
	}

	if reverseSwapInfo, err := sdk.PayOnchain(payOnchainRequest); err == nil {
		log.Printf("%#v", reverseSwapInfo)
	}
	// ANCHOR_END: start-reverse-swap
}

func CheckReverseSwapStatus() {
	// ANCHOR: check-reverse-swaps-status
	if swaps, err := sdk.InProgressOnchainPayments(); err == nil {
		for _, swap := range swaps {
			log.Printf("Onchain payment %v in progress, status is %v", swap.Id, swap.Status)
		}
	}
	// ANCHOR_END: check-reverse-swaps-status
}
