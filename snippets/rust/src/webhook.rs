use anyhow::Result;
use breez_sdk_core::*;
use std::sync::Arc;

async fn register_webhook(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: register-webook
    sdk.register_webhook(
        "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>".to_string(),
    )
    .await?;
    // ANCHOR_END: register-webook

    Ok(())
}

async fn unregister_webhook(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: unregister-webook
    sdk.unregister_webhook(
        "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>".to_string(),
    )
    .await?;
    // ANCHOR_END: unregister-webook

    Ok(())
}
