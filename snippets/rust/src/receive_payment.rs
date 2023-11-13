use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn receive_payment(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: receive-payment
    let res = sdk
        .receive_payment(ReceivePaymentRequest {
            amount_msat: 3_000_000,
            description: "Invoice for 3000 sats".into(),
            ..Default::default()
        })
        .await?;
    // ANCHOR_END: receive-payment

    Ok(())
}
