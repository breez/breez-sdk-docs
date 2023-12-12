//
//  ClosedChannel.swift
//
//
//  Created by ruben on 12/12/2023.
//
import Foundation

import BreezSDK

func prepareRedeemOnchainFunds(sdk: BlockingBreezServices, feeRate: UInt32) -> PrepareRedeemOnchainFundsResponse? {
    // ANCHOR: prepare-redeem-onchain-funds
    let satPerVbyte = feeRate
    let req = PrepareRedeemOnchainFundsRequest(toAddress: "bc1..", satPerVbyte: satPerVbyte)
    let prepareRedeemOnchainFundsResponse = try? sdk.prepareRedeemOnchainFunds(req: req)
    // ANCHOR_END: prepare-redeem-onchain-funds
    return prepareRedeemOnchainFundsResponse
}

func redeemOnchainFunds(sdk: BlockingBreezServices, toAddress _: String, feeRate: UInt32) -> RedeemOnchainFundsResponse? {
    // ANCHOR: redeem-onchain-funds
    let satPerVbyte = feeRate
    let req = RedeemOnchainFundsRequest(toAddress: "bc1..", satPerVbyte: satPerVbyte)
    let redeemOnchainFundsResponse = try? sdk.redeemOnchainFunds(req: req)
    // ANCHOR_END: redeem-onchain-funds
    return redeemOnchainFundsResponse
}
