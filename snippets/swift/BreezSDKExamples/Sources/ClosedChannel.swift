//
//  ClosedChannel.swift
//
//
//  Created by ruben on 12/11/2023.
//
import Foundation

import BreezSDK

func prepareSweep(sdk: BlockingBreezServices, feeRate: UInt64) -> PrepareSweepResponse? {
    // // ANCHOR: prepare-sweep
    let satPerVbyte = feeRate
    let sweepRequest = try? sdk.prepareSweep(req: PrepareSweepRequest(toAddress: "bc1..", satPerVbyte: satPerVbyte))
    // ANCHOR_END: prepare-sweep
    return sweepRequest
}

func sweep(sdk: BlockingBreezServices, toAddress _: String, feeRate: UInt32) -> SweepResponse? {
    // // ANCHOR: sweep
    let satPerVbyte = feeRate
    let sweepRequest = try? sdk.sweep(req: SweepRequest(toAddress: "bc1..", satPerVbyte: satPerVbyte))
    // ANCHOR_END: sweep
    return sweepRequest
}
