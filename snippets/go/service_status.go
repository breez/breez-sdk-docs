package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func HealthCheckStatus() error {
	// ANCHOR: health-check-status
	healthCheck, err := breez_sdk.ServiceHealthCheck("<api key>")
	if err != nil {
		return err
	}
	log.Printf("Current service status is: %v", healthCheck.Status)
	// ANCHOR_END: health-check-status
	return nil
}

func ReportPaymentFailure() error {
	// ANCHOR: report-payment-failure
	paymentHash := "..."
	reportIssueRequest := breez_sdk.ReportIssueRequestPaymentFailure{
		Data: breez_sdk.ReportPaymentFailureDetails{
			PaymentHash: paymentHash,
		},
	}
	err := sdk.ReportIssue(reportIssueRequest)
	if err != nil {
		log.Printf("%#v", err)
		return err
	}
	// ANCHOR_END: report-payment-failure
	return nil
}
