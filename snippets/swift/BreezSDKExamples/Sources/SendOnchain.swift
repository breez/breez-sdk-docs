//
//  SendOnchain.swift
//
//
//  Created by ruben on 14/11/2023.
//

import BreezSDK
import Foundation

func GetCurrentFees(sdk: BlockingBreezServices) -> ReverseSwapPairInfo? {
    //  ANCHOR: estimate-current-reverse-swap-total-fees
    let sendAmountSat: UInt64 = 50_000
    let currentFees = try? sdk.fetchReverseSwapFees(req: ReverseSwapFeesRequest(sendAmountSat: sendAmountSat))
    print("Total estimated fees for reverse swap: \(String(describing: currentFees?.totalEstimatedFees))")
    // ANCHOR_END: estimate-current-reverse-swap-total-fees
    return currentFees
}

func ListCurrentFees(currentFees: ReverseSwapPairInfo) {
    // ANCHOR: get-current-reverse-swap-min-max
    print("Minimum amount, in sats: \(currentFees.min)")
    print("Maximum amount, in sats: \(currentFees.max)")
    // ANCHOR_END: get-current-reverse-swap-min-max
}

func maxReverseSwapAmount(sdk: BlockingBreezServices) -> MaxReverseSwapAmountResponse? {
    //  ANCHOR: max-reverse-swap-amount
    let maxAmount = try? sdk.maxReverseSwapAmount()
    print("Max reverse swap amount: \(String(describing: maxAmount?.totalSat))")
    // ANCHOR_END: max-reverse-swap-amount
    return maxAmount
}

func StartReverseSwap(sdk: BlockingBreezServices, currentFees: ReverseSwapPairInfo) -> SendOnchainResponse? {
    // ANCHOR: start-reverse-swap
    let destinationAddress = "bc1.."
    let amountSat = currentFees.min
    let satPerVbyte: UInt32 = 5

    let response = try? sdk.sendOnchain(req: SendOnchainRequest(amountSat: amountSat, onchainRecipientAddress: destinationAddress, pairHash: currentFees.feesHash, satPerVbyte: satPerVbyte))
    // ANCHOR_END: start-reverse-swap
    return response
}

func checkReverseSwap(sdk: BlockingBreezServices) {
    // ANCHOR: check-reverse-swaps-status
    if let inProgressReverseSwaps = try? sdk.inProgressReverseSwaps() {
        for rs in inProgressReverseSwaps {
            print("Reverse swap \(rs.id) in progress, status is \(rs.status)")
        }
    }
    // ANCHOR_END: check-reverse-swaps-status
}
