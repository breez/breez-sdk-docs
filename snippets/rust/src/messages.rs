use std::sync::Arc;

use anyhow::Result;
use breez_sdk::prelude::*;
use log::info;

async fn sign_message(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: sign-message
    let sign_message_request = SignMessageRequest {
        message: "<message to sign>".to_string(),
    };
    let sign_message_response = sdk
        .sign_message(&sign_message_request)?;

    // Get the node info for your pubkey
    let info = sdk.node_info().await?;

    let signature = sign_message_response.signature;
    let pubkey = info.id;

    info!("Pubkey: {}", pubkey);
    info!("Signature: {}", signature);
    // ANCHOR_END: sign-message
    Ok(())
}

fn check_message(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: check-message
    let check_message_request = CheckMessageRequest {
        message: "<message>".to_string(),
        pubkey: "<pubkey of signer>".to_string(),
        signature: "<message signature>".to_string(),
    };
    let check_message_response = sdk
        .check_message(&check_message_request)?;

    let is_valid = check_message_response.is_valid;

    info!("Signature valid: {}", is_valid);
    // ANCHOR_END: check-message
    Ok(())
}
