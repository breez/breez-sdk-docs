package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func LnurlWithdraw() {
	// ANCHOR: lnurl-withdraw
	// Endpoint can also be of the form:
	// lnurlw://domain.com/lnurl-withdraw?key=val
	lnurlWithdrawUrl := "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk"

	input, err := breez_sdk.ParseInput(lnurlWithdrawUrl)
	if err != nil {
		return err
	}

	switch inputType := input.(type) {
	case breez_sdk.InputTypeLnUrlWithdraw:
		amountMsat := inputType.Data.MinWithdrawable
		description := "comment"

		result, err := sdk.WithdrawLnurl(breez_sdk.LnUrlWithdrawRequest{
			Data:        inputType.Data,
			AmountMsat:  amountMsat,
			Description: &description,
		})
		if err != nil {
			return err
		}

		switch result.(type) {
		case breez_sdk.LnUrlCallbackStatusOk:
			log.Printf("Successfully withdrawn")
		default:
			log.Printf("Failed to withdraw")
		}
	}
	// ANCHOR_END: lnurl-withdraw
}
