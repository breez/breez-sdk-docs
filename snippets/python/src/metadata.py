import breez_sdk

def set_payment_metadata(sdk_services):
    try: 
        # ANCHOR: set-payment-metadata
        sdk_services.set_payment_metadata("target-payment-hash", '{"myCustomValue":true}')    
        # ANCHOR_END: set-payment-metadata
    except Exception as error: 
        # handle error
        raise

def filter_payment_metadata(sdk_services):
    # ANCHOR: filter-payment-metadata
    metadata_filters = [
        breez_sdk.MetadataFilter("myCustomValue", "true")
    ]

    try:
        sdk_services.list_payments(breez_sdk.ListPaymentsRequest(
            metadata_filters = metadata_filters
        ))
    except Exception as error:
        # handle error
        raise
    # ANCHOR_END: filter-payment-metadata

    # ANCHOR: filter-payment-metadata-string
    metadata_filters = [
        breez_sdk.MetadataFilter("customerName", "\"Satoshi Nakamoto\""),
        breez_sdk.MetadataFilter("customerName", json.dumps("Satoshi Nakamoto")),
    ]
    # ANCHOR_END: filter-payment-metadata-string

    # ANCHOR: filter-payment-metadata-object
    # This will *NOT* work
    metadata_filters = [
        breez_sdk.MetadataFilter("parent.nestedArray", "[1, 2, 3]")
    ]

    # This will work
    metadata_filters = [
        breez_sdk.MetadataFilter("parent.nestedArray", "[1,2,3]"),
        breez_sdk.MetadataFilter("parent.nestedArray", json.dumps([1,2,3], separators=(',', ':'))),
    ]
    # ANCHOR_END: filter-payment-metadata-object
