using Breez.Sdk;
using System.Text.Json;

public class MetadataSnippets
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
            var metadataFilters = new List<MetadataFilter>(
              new MetadataFilter(
                jsonPath: "myCustomValue",
                jsonValue: "true"
              )
            );

            var payments = sdk.ListPayments(
                new ListPaymentsRequest(
                    metadataFilters: metadataFilters
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
    {
        // ANCHOR: filter-payment-metadata-string
        var metadataFilters = new List<MetadataFilter>(
          new MetadataFilter(
            jsonPath: "customerName",
            jsonValue: "\"Satoshi Nakamoto\""
          ),
          new MetadataFilter(
            jsonPath: "customerName",
            jsonValue: JsonSerializer.Serialize("Satoshi Nakamoto")
          )
        );
        // ANCHOR_END: filter-payment-metadata-string
    }

    public void FilterPaymentMetadataObject(BlockingBreezServices sdk)
    {
        // ANCHOR: filter-payment-metadata-object
        // This will *NOT* work
        var _metadataFilters = new List<MetadataFilter>(
          new MetadataFilter(
            jsonPath: "parent.nestedArray",
            jsonValue: "[1, 2, 3]"
          )
        );

        // Any of these will work
        var metadataFilters = new List<MetadataFilter>(
          new MetadataFilter(
            jsonPath: "parent.nestedArray",
            jsonValue: "[1,2,3]"
          ),
          new MetadataFilter(
            jsonPath: "parent.nestedArray",
            jsonValue: JsonSerializer.Serialize(new int[] {1, 2, 3})
          )
        );
        // ANCHOR_END: filter-payment-metadata-object
    }
}
