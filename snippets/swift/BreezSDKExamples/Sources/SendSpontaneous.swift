//
//  SendSpontaneous.swift
//
//
//  Created by ruben on 14/11/2023.
//

import Foundation
import BreezSDK


func sendSpontaneousPayment(sdk: BlockingBreezServices) -> SendPaymentResponse? {
    // ANCHOR: send-spontaneous-payment
    let nodeId = "...";
    do {
        let response = try sdk.sendSpontaneousPayment(
            req: SendSpontaneousPaymentRequest(
                nodeId: "...",
                amountMsat: 3_000_000))
        // ANCHOR_END: send-spontaneous-payment
        return response
    } catch {
        // handle error
    }
    return nil
}
