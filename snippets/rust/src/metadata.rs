use std::sync::Arc;
use anyhow::Result;
use breez_sdk_core::*;

async fn set_payment_metadata(sdk: Arc<BreezServices>) -> Result<()> {
  // ANCHOR: set-payment-metadata
    sdk.set_payment_metadata("target-payment-hash", r#"{"myCustomValue":true}"#).await?;
  // ANCHOR_END: set-payment-metadata
  
    Ok(())
}

async fn filter_payment_metadata(sdk: Arc<BreezServices>) -> Result<()> {
  // ANCHOR: filter-payment-metadata
    let metadata_filters = vec![
        MetadataFilter {
            json_path: "myCustomValue".to_string(),
            json_value: "true".to_string(),
        },
    ];

    sdk.list_payments(ListPaymentsRequest {
        metadata_filters,
        ..Default::default(),
    }).await?;
  // ANCHOR_END: filter-payment-metadata
}

async fn filter_payment_metadata_string(sdk: Arc<BreezServices>) -> Result<()> {
  // ANCHOR: filter-payment-metadata-string
    // Note: The following are equivalent
    let metadata_filters = vec![
        MetadataFilter {
            json_path: "customerName".to_string(),
            json_value: r#""Satoshi Nakamoto""#.to_string(),
        },
        MetadataFilter {
            json_path: "customerName".to_string(),
            json_value: serde_json::json!("Satoshi Nakamoto").to_string(),
        },
    ];
  // ANCHOR_END: filter-payment-metadata-string
}

async fn filter_payment_metadata_object(sdk: Arc<BreezServices>) -> Result<()> {
  // ANCHOR: filter-payment-metadata-object
    // This will *NOT* work
    let metadata_filters = vec![
        MetadataFilter {
            json_path: "parent.nestedArray".to_string(),
            json_value: r#"[1, 2, 3]"#.to_string(),
        },
    ];

    // This will work
    let metadata_filters = vec![
        MetadataFilter {
            json_path: "parent.nestedArray".to_string(),
            json_value: r#"[1,2,3]"#.to_string(),
        },
    ];
  // ANCHOR_END: filter-payment-metadata-object
  
  // ANCHOR: filter-payment-metadata-object-serde
    let metadata_filters = vec![
        MetadataFilter {
            json_path: "parent.nestedArray".to_string(),
            json_value: serde_json::json!(&[1, 2, 3]).to_string(),
        },
    ];
  // ANCHOR_END: filter-payment-metadata-object-serde
    Ok(())
}
