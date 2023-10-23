use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn send_payment(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: send-payment
    let bolt11 = "...";
    sdk.send_payment(bolt11.into(), None).await?;
    // ANCHOR_END: send-payment

    Ok(())
}