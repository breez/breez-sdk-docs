package com.example.kotlinmpplib

import breez_sdk.*
class Metadata {
    fun SetPaymentMetadata(sdk: BlockingBreezServices) {
        // ANCHOR: set-payment-metadata
        try {
            sdk.setPaymentMetadata("target-payment-hash", """{"myCustomValue":true}""")
        } catch (e: Exception) {
            // Handle error
        }
        // ANCHOR_END: set-payment-metadata
    }

    fun FilterPaymentMetadata(sdk: BlockingBreezServices) {
        // ANCHOR: filter-payment-metadata
        val metadataFilters = listOf(MetadataFilter(
          jsonPath = "myCustomValue",
          jsonValue = "true"
        ))

        try {
            sdk.listPayments(
                ListPaymentsRequest(
                    metadataFilters = metadataFilters
                ))
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: filter-payment-metadata
    }

    fun FilterPaymentMetadataString(sdk: BlockingBreezServices) {
        // ANCHOR: filter-payment-metadata-string
        val metadataFilters = listOf(MetadataFilter(
          jsonPath = "customerName",
          jsonValue = "\"Satoshi Nakamoto\""
        ))
        // ANCHOR_END: filter-payment-metadata-string
    }

    fun FilterPaymentMetadataObject(sdk: BlockingBreezServices) {
        // ANCHOR: filter-payment-metadata-object
        // This will *NOT* work
        val _metadataFilters = listOf(MetadataFilter(
          jsonPath = "parent.nestedArray",
          jsonValue = "[1, 2, 3]"
        ))

        // Any of these will work
        val metadataFilters = listOf(MetadataFilter(
          jsonPath = "parent.nestedArray",
          jsonValue = "[1,2,3]"
        ))
        // ANCHOR_END: filter-payment-metadata-object
    }
}
