package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func LnurlAuth() error {
	// ANCHOR: lnurl-auth
	// keyauth://domain.com/auth?key=val
	lnurlAuthUrl := "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttvdankjm3lw3skw0tvdankjm3xdvcn6vtp8q6n2dfsx5mrjwtrxdjnqvtzv56rzcnyv3jrxv3sxqmkyenrvv6kve3exv6nqdtyv43nqcmzvdsnvdrzx33rsenxx5unqc3cxgeqgntfgu"

	input, err := breez_sdk.ParseInput(lnurlAuthUrl)
	if err != nil {
		return err
	}

	switch inputType := input.(type) {
	case breez_sdk.InputTypeLnUrlAuth:
		result, err := sdk.LnurlAuth(inputType.Data)
		if err != nil {
			return err
		}

		switch result.(type) {
		case breez_sdk.LnUrlCallbackStatusOk:
			log.Printf("Successfully authenticated")
		default:
			log.Printf("Failed to authenticate")
		}
	}
	// ANCHOR_END: lnurl-auth
	return nil
}
