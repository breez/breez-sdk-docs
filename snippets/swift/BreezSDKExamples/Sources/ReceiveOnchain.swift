//
//  ReceiveOnchain.swift
//
//
//  Created by ruben on 14/11/2023.
//

import BreezSDK
import Foundation

func generateReceiveOnchainAddress(sdk: BlockingBreezServices) -> String? {
    // ANCHOR: generate-receive-onchain-address
    let swapInfo = try? sdk.receiveOnchain(req: ReceiveOnchainRequest())

    // Send your funds to the bellow bitcoin address
    let address = swapInfo?.bitcoinAddress
    print("Minimum amount allowed to deposit in sats: \(swapInfo!.minAllowedDeposit)")
    print("Maximum amount allowed to deposit in sats: \(swapInfo!.maxAllowedDeposit)")
    // ANCHOR_END: generate-receive-onchain-address

    return address
}

func getSwapInProgress(sdk: BlockingBreezServices) -> SwapInfo? {
    // ANCHOR: in-progress-swap
    let swapInfo = try? sdk.inProgressSwap()
    // ANCHOR_END: in-progress-swap
    return swapInfo
}

func listRefundables(sdk: BlockingBreezServices) -> [SwapInfo]? {
    // ANCHOR: list-refundables
    let refundables = try? sdk.listRefundables()
    // ANCHOR_END: list-refundables
    return refundables
}

func executeRefund(sdk: BlockingBreezServices, refundables: SwapInfo, satPerVbyte: UInt32) -> RefundResponse? {
    // ANCHOR: execute-refund
    let destinationAddress = "..."
    let response = try? sdk.refund(req: RefundRequest(swapAddress: refundables.bitcoinAddress, toAddress: destinationAddress, satPerVbyte: satPerVbyte))
    // ANCHOR_END: execute-refund
    return response
}

func getChannelOpeningFees(sdk: BlockingBreezServices, amountMsat: UInt64) -> OpenChannelFeeResponse? {
    // ANCHOR: get-channel-opening-fees
    let response = try? sdk.openChannelFee(req: OpenChannelFeeRequest(amountMsat: amountMsat))
    // ANCHOR_END: get-channel-opening-fees
    return response
}
