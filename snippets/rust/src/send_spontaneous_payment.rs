use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn send_spontaneous_payment(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: send-spontaneous-payment
    let node_id = "...".into();

    sdk.send_spontaneous_payment(SendSpontaneousPaymentRequest {
        amount_msat: 3_000_000,
        node_id,
        extra_tlvs: None,
    })
    .await?;
    // ANCHOR_END: send-spontaneous-payment

    Ok(())
}
