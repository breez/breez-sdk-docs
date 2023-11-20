//
//  ReceivePayment.swift
//  
//
//  Created by ruben on 13/11/2023.
//

import BreezSDK

func receivePayment(sdk: BlockingBreezServices) -> ReceivePaymentResponse? {
    // ANCHOR: receive-payment
    let repsonse = try? sdk.receivePayment(
        req: ReceivePaymentRequest(
            amountMsat: 3_000_000,
            description: "Invoice for 3 000 000 sats"))
    // ANCHOR_END: receive-payment
    return repsonse
}
