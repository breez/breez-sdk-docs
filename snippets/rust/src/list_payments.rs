use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn list_payments(sdk: Arc<BreezServices>) -> Result<Vec<Payment>> {
    // ANCHOR: list-payments
    let payments = sdk.list_payments(
        ListPaymentsRequest {
            filter: PaymentTypeFilter::All,
            from_timestamp: None,
            to_timestamp: None,
            include_failures: None,
            offset: None,
            limit: None
        }
    ).await?;
    // ANCHOR_END: list-payments

    Ok(payments)
}

async fn list_payments_filtered(sdk: Arc<BreezServices>) -> Result<Vec<Payment>> {
    // ANCHOR: list-payments-filtered
    let payments = sdk.list_payments(
        ListPaymentsRequest {
            filter: PaymentTypeFilter::Sent,
            from_timestamp: Some(1696880000),
            to_timestamp: None,
            include_failures: Some(true),
            offset: None,
            limit: None
        }
    ).await?;
    // ANCHOR_END: list-payments-filtered

    Ok(payments)
}