package example

import (
    "log"

    "github.com/breez/breez-sdk-go/breez_sdk"
)

func BuyBitcoin() {
    // ANCHOR: buy-btc
    buyBitcoinRequest := breez_sdk.BuyBitcoinRequest{
        Provider: breez_sdk.BuyBitcoinProviderMoonpay,
    }
    if buyBitcoinResponse, err := sdk.BuyBitcoin(buyBitcoinRequest); err == nil {
        log.Printf("%#v", buyBitcoinResponse)
    }
    // ANCHOR_END: buy-btc
}
