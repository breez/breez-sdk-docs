using Breez.Sdk;
using System.Text.Json;

public class ServiceStatusSnippets
{
    public void SetPaymentMetadata(BlockingBreezServices sdk)
    {
        // ANCHOR: set-payment-metadata
        sdk.SetPaymentMetadata("target-payment-hash", "{\"myCustomValue\":true}");
        // ANCHOR_END: set-payment-metadata
    }

    public void FilterPaymentMetadata(BlockingBreezServices sdk)
    {
        // ANCHOR: filter-payment-metadata
        try
        {
            sdk.MetadataFilter[] metadataFilters = {
              sdk.MetadataFilter(
                json_path: "myCustomValue",
                json_value: "true",
              ),
            };

            var payments = sdk.ListPayments(
                new ListPaymentsRequest(
                    metadataFilters: metadataFilters,
                )
            );
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: filter-payment-metadata
    }

    public void FilterPaymentMetadataString(BlockingBreezServices sdk)
        // ANCHOR: filter-payment-metadata-string
        sdk.MetadataFilter[] metadataFilters = {
          sdk.MetadataFilter(
            json_path: "customerName",
            json_value: "\"Satoshi Nakamoto\"",
          ),
          sdk.MetadataFilter(
            json_path: "customerName",
            json_value: JsonSerializer.Serialize("Satoshi Nakamoto"),
          ),
        };
        // ANCHOR_END: filter-payment-metadata-string
    }

    public void FilterPaymentMetadataObject(BlockingBreezServices sdk)
        // ANCHOR: filter-payment-metadata-object
        // This will *NOT* work
        sdk.MetadataFilter[] metadataFilters = {
          sdk.MetadataFilter(
            json_path: "parent.nestedArray",
            json_value: "[1, 2, 3]",
          ),
        };

        // This will work
        sdk.MetadataFilter[] metadataFilters = {
          sdk.MetadataFilter(
            json_path: "parent.nestedArray",
            json_value: "[1,2,3]",
          ),
          sdk.MetadataFilter(
            json_path: "parent.nestedArray",
            json_value: JsonSerializer.Serialize(new int[] {1, 2, 3}),
          ),
        };
        // ANCHOR_END: filter-payment-metadata-object
    }
}
