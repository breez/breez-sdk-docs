package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func ListPayments() error {
	// ANCHOR: list-payments
	payments, err := sdk.ListPayments(breez_sdk.ListPaymentsRequest{})
	if err != nil {
		return err
	}
	log.Printf("%#v", payments)
	// ANCHOR_END: list-payments
	return nil
}

func ListPaymentsFiltered() error {
	// ANCHOR: list-payments-filtered
	filters := []breez_sdk.PaymentTypeFilter{breez_sdk.PaymentTypeFilterSent}
	fromTimestamp := int64(1696880000)
	includeFailures := true
	listPaymentsRequest := breez_sdk.ListPaymentsRequest{
		Filters:         &filters,
		FromTimestamp:   &fromTimestamp,
		IncludeFailures: &includeFailures,
	}
	payments, err := sdk.ListPayments(listPaymentsRequest)
	if err != nil {
		return err
	}
	log.Printf("%#v", payments)
	// ANCHOR_END: list-payments-filtered
	return nil
}
