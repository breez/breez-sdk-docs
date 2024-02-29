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

func FilterPaymentMetadata(sdk: BlockingBreezServices) -> [Payment]? {
    // ANCHOR: filter-payment-metadata
    let metadataFilters = [
        MetadataFilter(
            jsonPath: "myCustomValue",
            jsonValue: "true"
        )
    ]

    let payments = try? sdk.listPayments(
        req: ListPaymentsRequest(
            metadataFilters: metadataFilters
        )
    )
    // ANCHOR_END: filter-payment-metadata

    return payments
}

func FilterPaymentMetadataString(sdk: BlockingBreezServices) -> [Payment]? {
    // ANCHOR: filter-payment-metadata-string
    let metadataFilters = [
        MetadataFilter(
            jsonPath: "myCustomValue",
            jsonValue: #""true""#
        )
    ]
    // ANCHOR_END: filter-payment-metadata-string

    return try? sdk.listPayments(
        req: ListPaymentsRequest(
            metadataFilters: metadataFilters
        )
    )
}

func FilterPaymentMetadataObject(sdk: BlockingBreezServices) -> [Payment]? {
    // ANCHOR: filter-payment-metadata-object
    // This will *NOT* work
    var metadataFilters = [
        MetadataFilter(
            jsonPath: "myCustomValue",
            jsonValue: #"[1, 2, 3]"#
        )
    ]

    // Any of these will work
    metadataFilters = [
        MetadataFilter(
            jsonPath: "myCustomValue",
            jsonValue: #"[1,2,3]"#
        )
    ]
    // ANCHOR_END: filter-payment-metadata-object

    return try? sdk.listPayments(
        req: ListPaymentsRequest(
            metadataFilters: metadataFilters
        )
    )
}
