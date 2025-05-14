import breez_sdk

def set_payment_metadata(sdk_services):
    try: 
        # ANCHOR: set-payment-metadata
        sdk_services.set_payment_metadata(
            hash="target-payment-hash",
            metadata='{"myCustomValue":true}')    
        # ANCHOR_END: set-payment-metadata
    except Exception as error: 
        # handle error
        raise

def filter_payment_metadata(sdk_services):
    # ANCHOR: filter-payment-metadata
    metadata_filters = [
        breez_sdk.MetadataFilter(
            json_path="myCustomValue",
            json_value="true")
    ]

    try:
        req = breez_sdk.ListPaymentsRequest(metadata_filters=metadata_filters)
        sdk_services.list_payments(req=req)
    except Exception as error:
        # handle error
        raise
    # ANCHOR_END: filter-payment-metadata

    # ANCHOR: filter-payment-metadata-string
    metadata_filters = [
        breez_sdk.MetadataFilter(
            json_path="customerName",
            json_value="\"Satoshi Nakamoto\""),
        breez_sdk.MetadataFilter(
            json_path="customerName",
            json_value=json.dumps("Satoshi Nakamoto")),
    ]
    # ANCHOR_END: filter-payment-metadata-string

    # ANCHOR: filter-payment-metadata-object
    # This will *NOT* work
    metadata_filters = [
        breez_sdk.MetadataFilter(
            json_path="parent.nestedArray",
            json_value="[1, 2, 3]")
    ]

    # Any of these will work
    metadata_filters = [
        breez_sdk.MetadataFilter(
            json_path="parent.nestedArray",
            json_value="[1,2,3]"),
        breez_sdk.MetadataFilter(
            json_path="parent.nestedArray",
            json_value=json.dumps([1,2,3], separators=(',', ':'))),
    ]
    # ANCHOR_END: filter-payment-metadata-object
