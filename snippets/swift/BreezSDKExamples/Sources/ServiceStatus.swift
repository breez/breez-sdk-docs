//
//  ServiceStatus.swift
//
//
//  Created by dangeross on 27/11/2023.
//

import BreezSDK
import Foundation

func getServiceStatus(sdk: BlockingBreezServices) {
    // ANCHOR: health-check-status
    if let healthCheck = try? sdk.serviceHealthCheck() {
        print("Current service status is: \(healthCheck.status)")
    }
    // ANCHOR_END: health-check-status
}

func reportPaymentFailure(sdk: BlockingBreezServices) {
    // ANCHOR: report-payment-failure
    let paymentHash = "..."

    try? sdk.reportIssue(
        req: ReportIssueRequest.paymentFailure(
            data: ReportPaymentFailureDetails(paymentHash: paymentHash)))
    // ANCHOR_END: report-payment-failure
}
