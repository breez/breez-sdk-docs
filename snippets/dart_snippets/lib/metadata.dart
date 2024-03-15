import 'package:breez_sdk/sdk.dart';

Future<void> setPaymentMetadata({
  required String paymentHash,
  required String metadata,
}) async {
  // ANCHOR: set-payment-metadata
  await BreezSDK.setPaymentMetadata(
    hash: "target-payment-hash",
    metadata: '{"myCustomValue":true}',
  );
  // ANCHOR_END: set-payment-metadata
}

Future<void> filterPaymentMetadata() async {
  // ANCHOR: filter-payment-metadata
  List<MetadataFilter> metadataFilters = [
    MetadataFilter(
      jsonPath: "myCustomValue",
      jsonValue: "true",
    ),
  ];

  ListPaymentsRequest req = ListPaymentsRequest(metadataFilters: metadataFilters);
  await BreezSDK.listPayments(req: req);
  // ANCHOR_END: filter-payment-metadata

  // ANCHOR: filter-payment-metadata-string
  metadataFilters = [
    MetadataFilter(
      jsonPath: "customerName",
      jsonValue: '"Satoshi Nakamoto"',
    ),
  ];
  // ANCHOR_END: filter-payment-metadata-string

  // ANCHOR: filter-payment-metadata-object
  // This will *NOT* work
  metadataFilters = [
    MetadataFilter(
      jsonPath: "parent.nestedArray",
      jsonValue: "[1, 2, 3]",
    ),
  ];

  // Any of these will work
  metadataFilters = [
    MetadataFilter(
      jsonPath: "parent.nestedArray",
      jsonValue: "[1,2,3]",
    ),
  ];
  // ANCHOR_END: filter-payment-metadata-object
}
