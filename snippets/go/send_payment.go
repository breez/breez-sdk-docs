package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func SendPayment() error {
	// ANCHOR: send-payment
	bolt11 := "bolt11 invoice"
	useTrampoline := true
	// The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
	// The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
	optionalAmountMsat := uint64(3_000_000)
	optionalLabel := "<label>"
	sendPaymentRequest := breez_sdk.SendPaymentRequest{
		Bolt11:        bolt11,
		UseTrampoline: useTrampoline,
		AmountMsat:    &optionalAmountMsat,
		Label:         &optionalLabel,
	}
	response, err := sdk.SendPayment(sendPaymentRequest)
	if err != nil {
		return err
	}
	log.Printf("%#v", response)
	// ANCHOR_END: send-payment
	return nil
}
