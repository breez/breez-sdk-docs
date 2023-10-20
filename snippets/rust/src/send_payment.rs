use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn send_payment(sdk: Arc<BreezServices>) -> Result<()> {
    let bolt11 = "...";
    sdk.send_payment(bolt11.into(), None).await?;

    Ok(())
}