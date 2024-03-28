package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func HealthCheckStatus() {
	// ANCHOR: health-check-status
	if healthCheck, err := breez_sdk.ServiceHealthCheck("<api key>"); err != nil {
		log.Printf("Current service status is: %v", healthCheck.Status)
	}
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
	if err := sdk.ReportIssue(reportIssueRequest); err != nil {
		log.Printf("%#v", err)
	}
	// ANCHOR_END: report-payment-failure
}
