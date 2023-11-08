package example

import (
    "log"

    "github.com/breez/breez-sdk-go/breez_sdk"
)

func GetCurrentFees() {
    // ANCHOR: estimate-current-reverse-swap-total-fees
    sendAmountSat := uint64(50_000)
    reverseSwapFeesRequest := breez_sdk.ReverseSwapFeesRequest{
        SendAmountSat: &sendAmountSat,
    }
    if currentFees, err := sdk.FetchReverseSwapFees(reverseSwapFeesRequest); err == nil {
        log.Printf("Total estimated fees for reverse swap: %v", currentFees.TotalEstimatedFees)
    }
    // ANCHOR_END: estimate-current-reverse-swap-total-fees
}

func ListCurrentFees(currentFees breez_sdk.ReverseSwapPairInfo) {
    // ANCHOR: get-current-reverse-swap-min-max
    log.Printf("Minimum amount, in sats: %v", currentFees.Min)
    log.Printf("Maximum amount, in sats: %v", currentFees.Max)
    // ANCHOR_END: get-current-reverse-swap-min-max
}

func StartReverseSwap() {
    // ANCHOR: start-reverse-swap
    destinationAddress := "bc1.."
    sendAmountSat := uint64(50_000)
    satPerVbyte := uint32(5)
    if currentFees, err := sdk.FetchReverseSwapFees(breez_sdk.ReverseSwapFeesRequest{SendAmountSat: &sendAmountSat}); err == nil {
        sendOnchainRequest := breez_sdk.SendOnchainRequest{
            AmountSat:               sendAmountSat,
            OnchainRecipientAddress: destinationAddress,
            PairHash:                currentFees.FeesHash,
            SatPerVbyte:             satPerVbyte,
        }
        if reverseSwapInfo, err := sdk.SendOnchain(sendOnchainRequest); err == nil {
            log.Printf("%#v", reverseSwapInfo)
        }
    }
    // ANCHOR_END: start-reverse-swap
}

func CheckReverseSwapStatus() {
    // ANCHOR: check-reverse-swaps-status
    if swaps, err := sdk.InProgressReverseSwaps(); err == nil {
        for _, swap := range swaps {
            log.Printf("Reverse swap %v in progress, status is %v", swap.Id, swap.Status)
        }
    }
    // ANCHOR_END: check-reverse-swaps-status
}
