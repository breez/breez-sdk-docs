use anyhow::Result;
use breez_sdk_core::*;
use std::sync::Arc;

async fn register_webhook(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: register-webook
    let url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>".to_string();
    sdk.register_webhook(url).await?;
    // ANCHOR_END: register-webook

    Ok(())
}

async fn unregister_webhook(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: unregister-webook
    let url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>".to_string();
    sdk.unregister_webhook(url).await?;
    // ANCHOR_END: unregister-webook

    Ok(())
}
