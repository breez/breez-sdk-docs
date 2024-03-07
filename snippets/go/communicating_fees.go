package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func GetFeeInfoAfterInvoiceCreated(receivePaymentResponse breez_sdk.ReceivePaymentResponse) {
	// ANCHOR: get-fee-info-after-invoice-created
	var openingFeeSat int
	openingFeeMsat := receivePaymentResponse.OpeningFeeMsat
	if openingFeeMsat != nil {
		openingFeeSat = *openingFeeMsat / 1000
	} else {
	    openingFeeSat = 0
	}
	log.Printf("A setup fee of %#v sats is applied to this invoice.", openingFeeSat)
	// ANCHOR_END: get-fee-info-after-invoice-created
}
