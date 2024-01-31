//
//  ListPayments.swift
//
//
//  Created by ruben on 13/11/2023.
//

import BreezSDK
import Foundation

func ListPayments(sdk: BlockingBreezServices) -> [Payment]? {
    // ANCHOR: list-payments
    let payments = try? sdk.listPayments(req: ListPaymentsRequest())
    // ANCHOR_END: list-payments
    return payments
}

func ListPaymentsFiltered(sdk: BlockingBreezServices) -> [Payment]? {
    // ANCHOR: list-payments-filtered
    let payments = try? sdk.listPayments(
        req: ListPaymentsRequest(
            filters: [.sent],
            fromTimestamp: 1_696_880_000,
            includeFailures: true
        ))
    // ANCHOR_END: list-payments-filtered
    return payments
}
