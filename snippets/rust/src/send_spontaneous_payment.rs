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

async fn send_spontaneous_payment_with_tlvs(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: send-spontaneous-payment-with-tlvs
    let node_id = "...".into();
    let extra_tlvs = vec![TlvEntry {
        field_number: 34349334,
        value: "Hello world!".as_bytes().to_vec(),
    }];

    sdk.send_spontaneous_payment(SendSpontaneousPaymentRequest {
        amount_msat: 3_000_000,
        node_id,
        extra_tlvs: Some(extra_tlvs),
    })
    .await?;
    // ANCHOR_END: send-spontaneous-payment-with-tlvs

    Ok(())
}
