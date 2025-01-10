package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func ReceivePayment() error {
	// ANCHOR: receive-payment
	receivePaymentRequest := breez_sdk.ReceivePaymentRequest{
		AmountMsat:  uint64(3_000_000),
		Description: "Invoice for 3000 sats",
	}
	receivePaymentResponse, err := sdk.ReceivePayment(receivePaymentRequest)
	if err != nil {
		return err
	}
	log.Printf("Invoice: %#v", receivePaymentResponse.LnInvoice)
	// ANCHOR_END: receive-payment
	return nil
}
