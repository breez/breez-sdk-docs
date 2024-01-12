package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func ReceivePayment() {
	// ANCHOR: receive-payment
	receivePaymentRequest := breez_sdk.ReceivePaymentRequest{
		AmountMsat:  uint64(3_000_000),
		Description: "Invoice for 3000 sats",
	}
	if receivePaymentResponse, err := sdk.ReceivePayment(receivePaymentRequest); err == nil {
		log.Printf("Invoice: %#v", receivePaymentResponse.LnInvoice)
	}
	// ANCHOR_END: receive-payment
}
