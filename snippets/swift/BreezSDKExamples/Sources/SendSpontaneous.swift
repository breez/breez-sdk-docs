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
    let response = try? sdk.sendSpontaneousPayment(
        req: SendSpontaneousPaymentRequest(
            nodeId: "...",
            amountMsat: 3_000_000))
    // ANCHOR_END: send-spontaneous-payment
    return response  
}

func sendSpontaneousPaymentWithTlvs(sdk: BlockingBreezServices) -> SendPaymentResponse? {
    // ANCHOR: send-spontaneous-payment-with-tlvs
    let extraTlvs = [TlvEntry(fieldNumber: 34_349_334, value: Array("Hello world!".utf8))]
    let response = try? sdk.sendSpontaneousPayment(
        req: SendSpontaneousPaymentRequest(
            nodeId: "...",
            amountMsat: 3_000_000,
            extraTlvs: extraTlvs))
    // ANCHOR_END: send-spontaneous-payment-with-tlvs
    return response
}
