package example

import (
	"encoding/hex"
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func SendSpontaneousPayment() {
	// ANCHOR: send-spontaneous-payment
	sendSpontaneousPaymentRequest := breez_sdk.SendSpontaneousPaymentRequest{
		NodeId:     "...",
		AmountMsat: uint64(3_000_000),
	}
	if response, err := sdk.SendSpontaneousPayment(sendSpontaneousPaymentRequest); err == nil {
		log.Printf("%#v", response)
	}
	// ANCHOR_END: send-spontaneous-payment
}
func SendSpontaneousPaymentWithTlvs() {
	// ANCHOR: send-spontaneous-payment-with-tlvs
	value, _ := hex.DecodeString("Hello world!")
	extraTlvs := []breez_sdk.TlvEntry{
		breez_sdk.TlvEntry{
			FieldNumber: uint64(34349334),
			Value:       value,
		},
	}
	sendSpontaneousPaymentRequest := breez_sdk.SendSpontaneousPaymentRequest{
		NodeId:     "...",
		AmountMsat: uint64(3_000_000),
		ExtraTlvs:  &extraTlvs,
	}
	if response, err := sdk.SendSpontaneousPayment(sendSpontaneousPaymentRequest); err == nil {
		log.Printf("%#v", response)
	}
	// ANCHOR_END: send-spontaneous-payment-with-tlvs
}
