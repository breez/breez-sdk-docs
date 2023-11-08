package example

import (
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
