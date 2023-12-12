//
//  SendSpontaneous.swift
//
//
//  Created by ruben on 14/11/2023.
//

import BreezSDK
import Foundation

func sendSpontaneousPayment(sdk: BlockingBreezServices) -> SendPaymentResponse? {
    // ANCHOR: send-spontaneous-payment
    let response = try? sdk.sendSpontaneousPayment(
        req: SendSpontaneousPaymentRequest(
            nodeId: "...",
            amountMsat: 3_000_000
        ))
    // ANCHOR_END: send-spontaneous-payment
    return response
}
