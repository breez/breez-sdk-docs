package example

import (
	"encoding/json"
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func SetPaymentMetadata() {
	// ANCHOR: set-payment-metadata
	sdk.SetPaymentMetadata("target-payment-hash", `{"myCustomValue":true}`)
	// ANCHOR_END: set-payment-metadata
}

func FilterPaymentMetadata() {
	// ANCHOR: filter-payment-metadata
	metadataFilters := []breez_sdk.MetadataFilter{
		{JsonPath: "myCustomValue", JsonValue: "true"},
	}

	payments, err := sdk.ListPayments(breez_sdk.ListPaymentsRequest{
		MetadataFilters: &metadataFilters,
	})

	if err != nil {
		// handle error
	}
	// ANCHOR_END: filter-payment-metadata
	log.Printf("%#v", payments)
}

func FilterPaymentMetadataString() {
	// ANCHOR: filter-payment-metadata-string
	metadataFilters := []breez_sdk.MetadataFilter{
		{JsonPath: "customerName", JsonValue: "\"Satoshi Nakamoto\""},
	}

	jsonValue, _ := json.Marshal("Satoshi Nakamoto")
	metadataFilters = []breez_sdk.MetadataFilter{
		{
			JsonPath:  "customerName",
			JsonValue: string(jsonValue),
		},
	}
	// ANCHOR_END: filter-payment-metadata-string

	sdk.ListPayments(breez_sdk.ListPaymentsRequest{
		MetadataFilters: &metadataFilters,
	})
}

func FilterPaymentMetadataObject() {
	// ANCHOR: filter-payment-metadata-object
	// This will *NOT* work
	metadataFilters := []breez_sdk.MetadataFilter{
		{JsonPath: "parent.nestedArray", JsonValue: "[1, 2, 3]"},
	}

	// This will work
	jsonValue, _ := json.Marshal([]int{1, 2, 3})

	metadataFilters = []breez_sdk.MetadataFilter{
		{JsonPath: "parent.nestedArray", JsonValue: "[1,2,3]"},
		{JsonPath: "parent.nestedArray", JsonValue: string(jsonValue)},
	}
	// ANCHOR_END: filter-payment-metadata-object

	sdk.ListPayments(breez_sdk.ListPaymentsRequest{
		MetadataFilters: &metadataFilters,
	})
}
