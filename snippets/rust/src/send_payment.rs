use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn send_payment(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: send-payment
    let bolt11 = "...".into();

    sdk.send_payment(SendPaymentRequest {
        bolt11,
        amount_msat: None
    }).await?;
    // ANCHOR_END: send-payment

    Ok(())
}