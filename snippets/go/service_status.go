package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func HealthCheckStatus() {
	// ANCHOR: health-check-status
	healthCheck, err := breez_sdk.ServiceHealthCheck("<api key>")
	if err != nil {
		return err
	}
	log.Printf("Current service status is: %v", healthCheck.Status)
	// ANCHOR_END: health-check-status
}

func ReportPaymentFailure() {
	// ANCHOR: report-payment-failure
	paymentHash := "..."
	reportIssueRequest := breez_sdk.ReportIssueRequestPaymentFailure{
		Data: breez_sdk.ReportPaymentFailureDetails{
			PaymentHash: paymentHash,
		},
	}

	_, err := sdk.ReportIssue(reportIssueRequest)
	if err != nil {
		return err
	}
	// ANCHOR_END: report-payment-failure
}
