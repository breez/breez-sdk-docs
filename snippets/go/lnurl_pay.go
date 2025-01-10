package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func LnurlPay() error {
	// ANCHOR: lnurl-pay
	// Endpoint can also be of the form:
	// lnurlp://domain.com/lnurl-pay?key=val
	// lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
	lnurlPayUrl := "lightning@address.com"

	input, err := breez_sdk.ParseInput(lnurlPayUrl)
	if err != nil {
		return err
	}

	switch inputType := input.(type) {
	case breez_sdk.InputTypeLnUrlPay:
		useTrampoline := true
		amountMsat := inputType.Data.MinSendable
		optionalComment := "<comment>"
		optionalPaymentLabel := "<label>"
		lnUrlPayRequest := breez_sdk.LnUrlPayRequest{
			Data:          inputType.Data,
			UseTrampoline: useTrampoline,
			AmountMsat:    amountMsat,
			Comment:       &optionalComment,
			PaymentLabel:  &optionalPaymentLabel,
		}
		result, err := sdk.PayLnurl(lnUrlPayRequest)
		if err != nil {
			return err
		}

		switch result.(type) {
		case breez_sdk.LnUrlPayResultEndpointSuccess:
			log.Printf("Successfully paid")
		default:
			log.Printf("Failed to pay")
		}
	}
	// ANCHOR_END: lnurl-pay
	return nil
}
