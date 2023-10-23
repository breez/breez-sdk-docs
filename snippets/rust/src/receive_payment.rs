use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn receive_payment(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: receive-payment
    let res = sdk.receive_payment(
        ReceivePaymentRequest {
            amount_sats: 3000,
            description: "Invoice for 3000 sats".into(),
            cltv: None,
            expiry: None,
            opening_fee_params: None,
            preimage: None,
            use_description_hash: None
        })
        .await?;
    // ANCHOR_END: receive-payment

    Ok(())
}