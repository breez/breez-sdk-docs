package com.example.kotlinmpplib

import breez_sdk.*
class ServiceStatus {
    fun HealthCheckStatus(sdk: BlockingBreezServices) {
        // ANCHOR: health-check-status
        try {
            val healthCheck = sdk.serviceHealthCheck()
            // Log.v("Breez", "Current service status is: ${healthCheck.status}")
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: health-check-status
    }

    fun reportPaymentFailure(sdk: BlockingBreezServices) {
        // ANCHOR: report-payment-failure
        val paymentHash = "..."
        try {
            sdk.reportIssue(ReportIssueRequest.PaymentFailure(
                ReportPaymentFailureDetails(paymentHash)))
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: report-payment-failure
    }
}