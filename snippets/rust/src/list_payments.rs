use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn list_payments(sdk: Arc<BreezServices>) -> Result<Vec<Payment>> {
    // ANCHOR: list-payments
    let payments = sdk.list_payments(ListPaymentsRequest::default()).await?;
    // ANCHOR_END: list-payments

    Ok(payments)
}

async fn list_payments_filtered(sdk: Arc<BreezServices>) -> Result<Vec<Payment>> {
    // ANCHOR: list-payments-filtered
    let payments = sdk
        .list_payments(ListPaymentsRequest {
            filters: Some(vec![PaymentTypeFilter::Sent]),
            from_timestamp: Some(1696880000),
            include_failures: Some(true),
            ..Default::default()
        })
        .await?;
    // ANCHOR_END: list-payments-filtered

    Ok(payments)
}
