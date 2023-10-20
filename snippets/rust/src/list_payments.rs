use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn list_payments(sdk: Arc<BreezServices>) -> Result<Vec<Payment>> {
    let payments = sdk.list_payments(
        ListPaymentRequest {
            filter: PaymentTypeFilter::All,
            from_timestamp: None,
            to_timestamp: None,
            include_failures: None,
        }
    ).await?;

    Ok(payments)
}

async fn list_payments_filtered(sdk: Arc<BreezServices>) -> Result<Vec<Payment>> {
    let payments = sdk.list_payments(
        ListPaymentRequest {
            filter: PaymentTypeFilter::Sent,
            from_timestamp: 1696880000,
            to_timestamp: None,
            include_failures: true,
        }
    ).await?;

    Ok(payments)
}