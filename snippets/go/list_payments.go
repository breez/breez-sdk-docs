package example

import (
    "log"

    "github.com/breez/breez-sdk-go/breez_sdk"
)

func ListPayments() {
    // ANCHOR: list-payments
    if payments, err := sdk.ListPayments(breez_sdk.ListPaymentsRequest{Filter: breez_sdk.PaymentTypeFilterAll}); err == nil {
        log.Printf("%#v", payments)
    }
    // ANCHOR_END: list-payments
}

func ListPaymentsFiltered() {
    // ANCHOR: list-payments-filtered
    fromTimestamp := int64(1696880000)
    includeFailures := true
    listPaymentsRequest := breez_sdk.ListPaymentsRequest{
        Filter:          breez_sdk.PaymentTypeFilterSent,
        FromTimestamp:   &fromTimestamp,
        IncludeFailures: &includeFailures,
    }
    if payments, err := sdk.ListPayments(listPaymentsRequest); err == nil {
        log.Printf("%#v", payments)
    }
    // ANCHOR_END: list-payments-filtered
}
