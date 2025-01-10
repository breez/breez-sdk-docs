package example

import (
	"encoding/json"
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func SetPaymentMetadata() error {
	// ANCHOR: set-payment-metadata
	err := sdk.SetPaymentMetadata("target-payment-hash", `{"myCustomValue":true}`)
	if err != nil {
		return err
	}
	// ANCHOR_END: set-payment-metadata
	return nil
}

func FilterPaymentMetadata() error {
	// ANCHOR: filter-payment-metadata
	metadataFilters := []breez_sdk.MetadataFilter{
		{JsonPath: "myCustomValue", JsonValue: "true"},
	}

	payments, err := sdk.ListPayments(breez_sdk.ListPaymentsRequest{
		MetadataFilters: &metadataFilters,
	})

	if err != nil {
		return err
	}
	// ANCHOR_END: filter-payment-metadata
	log.Printf("%#v", payments)
	return nil
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
	log.Printf("%#v", metadataFilters)
}

func FilterPaymentMetadataObject() {
	// ANCHOR: filter-payment-metadata-object
	// This will *NOT* work
	metadataFilters := []breez_sdk.MetadataFilter{
		{JsonPath: "parent.nestedArray", JsonValue: "[1, 2, 3]"},
	}

	// Any of these will work
	jsonValue, _ := json.Marshal([]int{1, 2, 3})

	metadataFilters = []breez_sdk.MetadataFilter{
		{JsonPath: "parent.nestedArray", JsonValue: "[1,2,3]"},
		{JsonPath: "parent.nestedArray", JsonValue: string(jsonValue)},
	}
	// ANCHOR_END: filter-payment-metadata-object
	log.Printf("%#v", metadataFilters)
}
