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
    let optionalLabel = "<label>"
    let req = SendSpontaneousPaymentRequest(nodeId: "...", amountMsat: 3_000_000, label: optionalLabel)
    let response = try? sdk.sendSpontaneousPayment(req: req)
    // ANCHOR_END: send-spontaneous-payment
    return response  
}

func sendSpontaneousPaymentWithTlvs(sdk: BlockingBreezServices) -> SendPaymentResponse? {
    // ANCHOR: send-spontaneous-payment-with-tlvs
    let optionalExtraTlvs = [TlvEntry(fieldNumber: 34_349_334, value: Array("Hello world!".utf8))]
    let req = SendSpontaneousPaymentRequest(nodeId: "...", amountMsat: 3_000_000, extraTlvs: optionalExtraTlvs)
    let response = try? sdk.sendSpontaneousPayment(req: req)
    // ANCHOR_END: send-spontaneous-payment-with-tlvs
    return response
}
