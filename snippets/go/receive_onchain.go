package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func GenerateReceiveOnchainAddress() error {
	// ANCHOR: generate-receive-onchain-address
	swapInfo, err := sdk.ReceiveOnchain(breez_sdk.ReceiveOnchainRequest{})
	if err != nil {
		return err
	}
	// Send your funds to the below bitcoin address
	address := swapInfo.BitcoinAddress
	log.Printf("%v", address)

	log.Printf("Minimum amount allowed to deposit in sats: %v", swapInfo.MinAllowedDeposit)
	log.Printf("Maximum amount allowed to deposit in sats: %v", swapInfo.MaxAllowedDeposit)
	// ANCHOR_END: generate-receive-onchain-address
	return nil
}

func GetInProgressSwap() error {
	// ANCHOR: in-progress-swap
	swapInfo, err := sdk.InProgressSwap()
	if err != nil {
		return err
	}
	log.Printf("%#v", swapInfo)
	// ANCHOR_END: in-progress-swap
	return nil
}

func ListRefundables() error {
	// ANCHOR: list-refundables
	refundables, err := sdk.ListRefundables()
	if err != nil {
		return err
	}
	log.Printf("%#v", refundables)
	// ANCHOR_END: list-refundables
	return nil
}

func ExecuteRefund() error {
	// ANCHOR: execute-refund
	refundables, err := sdk.ListRefundables()
	if err != nil {
		return err
	}
	destinationAddress := "..."
	satPerVbyte := uint32(5)
	refundRequest := breez_sdk.RefundRequest{
		SwapAddress: refundables[0].BitcoinAddress,
		ToAddress:   destinationAddress,
		SatPerVbyte: satPerVbyte,
	}
	result, err := sdk.Refund(refundRequest)
	if err != nil {
		return err
	}
	log.Printf("%v", result)
	// ANCHOR_END: execute-refund
	return nil
}

func GetChannelOpeningFees(amountMsat *uint64) error {
	// ANCHOR: get-channel-opening-fees
	channelFees, err := sdk.OpenChannelFee(breez_sdk.OpenChannelFeeRequest{AmountMsat: amountMsat})
	if err != nil {
		return err
	}
	log.Printf("%#v", channelFees)
	// ANCHOR_END: get-channel-opening-fees
	return nil
}

func RescanSwaps() error {
	// ANCHOR: rescan-swaps
	err := sdk.RescanSwaps()
	if err != nil {
		return err
	}
	log.Println("Rescan finished")
	// ANCHOR_END: rescan-swaps
	return nil
}
