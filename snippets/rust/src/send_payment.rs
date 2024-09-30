use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn send_payment(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: send-payment
    let use_trampoline = false;
    // The `amount_msat` param is optional and should only passed if the bolt11 doesn't specify an amount.
    // The amount_msat is required in case an amount is not specified in the bolt11 invoice'.
    let optional_amount_msat: Option<u64> = None;
    let optional_label = Some("<label>".to_string());

    let req = SendPaymentRequest {
        bolt11: "...".into(),
        use_trampoline,
        amount_msat: optional_amount_msat,
        label: optional_label,
    };
    let response = sdk.send_payment(req).await?;
    // ANCHOR_END: send-payment

    Ok(())
}
