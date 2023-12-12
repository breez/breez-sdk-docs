//
//  SendPayment.swift
//
//
//  Created by ruben on 13/11/2023.
//

import BreezSDK

func sendPayment(sdk: BlockingBreezServices) -> SendPaymentResponse? {
    // ANCHOR: send-payment
    // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
    // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
    let req = SendPaymentRequest(bolt11: "...", amountMsat: 3_000_000)
    let response = try? sdk.sendPayment(req: req)
    // ANCHOR_END: send-payment
    return response
}
