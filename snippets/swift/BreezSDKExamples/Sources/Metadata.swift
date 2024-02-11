//
//  Metadata.swift
//  
//
//

import Foundation
import BreezSDK

func SetPaymentMetadata(sdk: BlockingBreezServices) throws {
    // ANCHOR: set-payment-metadata
    try sdk.setPaymentMetadata(hash: "target-payment-hash", metadata: #"{"myCustomValue":true}"#)    
    // ANCHOR_END: set-payment-metadata
}

func FilterPaymentMetadata(sdk: BlockingBreezServices) throws {
    // ANCHOR: filter-payment-metadata
    let metadataFilters = [
        MetadataFilter(
            jsonPath: "myCustomValue",
            jsonValue: "true"
        )
    ]

    try? sdk.listPayments(
        req: ListPaymentsRequest(
            metadataFilters: metadataFilters
        )
    )
    // ANCHOR_END: filter-payment-metadata
}

func FilterPaymentMetadataString(sdk: BlockingBreezServices) throws {
    // ANCHOR: filter-payment-metadata-string
    let metadataFilters = [
        MetadataFilter(
            jsonPath: "myCustomValue",
            jsonValue: #""true""#
        )
    ]
    // ANCHOR_END: filter-payment-metadata-string
}

func FilterPaymentMetadataObject(sdk: BlockingBreezServices) throws {
    // ANCHOR: filter-payment-metadata-object
    // This will *NOT* work
    let _metadataFilters = [
        MetadataFilter(
            jsonPath: "myCustomValue",
            jsonValue: #"[1, 2, 3]"#
        )
    ]

    // Any of these will work
    let metadataFilters = [
        MetadataFilter(
            jsonPath: "myCustomValue",
            jsonValue: #"[1,2,3]"#
        )
    ]
    // ANCHOR_END: filter-payment-metadata-object
}
