use anyhow::Result;
use breez_sdk_core::*;
use std::sync::Arc;

async fn webhook(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: register-webook
    sdk.register_webhook("https://yourapplication.com".to_string())
        .await?;
    // ANCHOR_END: register-webook

    Ok(())
}

async fn payment_webhook(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: register-payment-webook
    sdk.register_webhook(
        "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>".to_string(),
    )
    .await?;
    // ANCHOR_END: register-payment-webook

    Ok(())
}
