use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn send_spontaneous_payment(sdk: Arc<BreezServices>) -> Result<()> {
    let node_id = "...";
    sdk.send_spontaneous_payment(node_id.into(), 3000).await?;

    Ok(())
}