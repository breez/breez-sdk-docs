package example

import (
    "log"

    "github.com/breez/breez-sdk-go/breez_sdk"
)

func GenerateReceiveOnchainAddress() {
    // ANCHOR: generate-receive-onchain-address
    if swapInfo, err := sdk.ReceiveOnchain(breez_sdk.ReceiveOnchainRequest{}); err != nil {
        // Send your funds to the below bitcoin address
        address := swapInfo.BitcoinAddress
        log.Printf("%v", address)
    }
    // ANCHOR_END: generate-receive-onchain-address
}

func GetInProgressSwap() {
    // ANCHOR: in-progress-swap
    if swapInfo, err := sdk.InProgressSwap(); err == nil {
        log.Printf("%#v", swapInfo)
    }
    // ANCHOR_END: in-progress-swap
}

func ListRefundables() {
    // ANCHOR: list-refundables
    if refundables, err := sdk.ListRefundables(); err == nil {
        log.Printf("%#v", refundables)
    }
    // ANCHOR_END: list-refundables
}

func ExecuteRefund() {
    // ANCHOR: execute-refund
    if refundables, err := sdk.ListRefundables(); err == nil {
        destinationAddress := "..."
        satPerVbyte := uint32(5)
        refundRequest := breez_sdk.RefundRequest{
            SwapAddress: refundables[0].BitcoinAddress,
            ToAddress:   destinationAddress,
            SatPerVbyte: satPerVbyte,
        }
        if result, err := sdk.Refund(refundRequest); err == nil {
            log.Printf("%v", result)
        }
    }
    // ANCHOR_END: execute-refund
}

func GetChannelOpeningFees(amountMsat uint64) {
    // ANCHOR: get-channel-opening-fees
    if channelFees, err := sdk.OpenChannelFee(breez_sdk.OpenChannelFeeRequest{AmountMsat: amountMsat}); err == nil {
        log.Printf("%#v", channelFees)
    }
    // ANCHOR_END: get-channel-opening-fees
}
