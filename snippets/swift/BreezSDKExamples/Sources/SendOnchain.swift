//
//  SendOnchain.swift
//
//
//  Created by ruben on 14/11/2023.
//

import BreezSDK
import Foundation

func GetCurrentLimits(sdk: BlockingBreezServices) -> ReverseSwapPairInfo? {
    //  ANCHOR: get-current-reverse-swap-limits
    let currentLimits = try? sdk.onchainPaymentLimits()
    print("Minimum amount, in sats: \(currentLimits.minSat)")
    print("Maximum amount, in sats: \(currentLimits.maxSat)")
    // ANCHOR_END: get-current-reverse-swap-limits
    return currentFees
}

func PreparePayOnchain(sdk: BlockingBreezServices, currentLimits: OnchainPaymentLimitsResponse) -> PrepareOnchainPaymentResponse? {
    // ANCHOR: prepare-pay-onchain
    let amountSat = currentLimits.minSat
    let satPerVbyte: UInt32 = 5

    let prepareRequest = PrepareOnchainPaymentRequest(amountSat: amountSat, amountType: .send, claimTxFeerate: satPerVbyte);
    let prepareResponse = try? sdk.prepareOnchainPayment(req: prepareRequest)

    print("Sender amount, in sats: \(prepareResponse.senderAmountSat)")
    print("Recipient amount, in sats: \(prepareResponse.recipientAmountSat)")
    print("Total fees, in sats: \(prepareResponse.totalFees)")
    // ANCHOR_END: prepare-pay-onchain
    return prepareResponse
}

func StartReverseSwap(sdk: BlockingBreezServices, prepareResponse: PrepareOnchainPaymentRequest) -> SendOnchainResponse? {
    // ANCHOR: start-reverse-swap
    let destinationAddress = "bc1.."

    let response = try? sdk.payOnchain(req: PayOnchainRequest(recipientAddress: destinationAddress, prepareRes: prepareResponse))
    // ANCHOR_END: start-reverse-swap
    return response
}

func checkReverseSwap(sdk: BlockingBreezServices) {
    // ANCHOR: check-reverse-swaps-status
    if let inProgressOnchainPayments = try? sdk.inProgressOnchainPayments() {
        for rs in inProgressReverseSwaps {
            print("Onchain payment \(rs.id) in progress, status is \(rs.status)")
        }
    }
    // ANCHOR_END: check-reverse-swaps-status
}
