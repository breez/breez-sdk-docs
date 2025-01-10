package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func BuyBitcoin() error {
	// ANCHOR: buy-btc
	buyBitcoinRequest := breez_sdk.BuyBitcoinRequest{
		Provider: breez_sdk.BuyBitcoinProviderMoonpay,
	}
	buyBitcoinResponse, err := sdk.BuyBitcoin(buyBitcoinRequest)
	if err != nil {
		return err
	}
	log.Printf("%#v", buyBitcoinResponse)
	// ANCHOR_END: buy-btc
	return nil
}
