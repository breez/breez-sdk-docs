use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn generate_receive_onchain_address(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: generate-receive-onchain-address
    let swap_info = sdk.receive_onchain(
        ReceiveOnchainRequest { opening_fee_params: None } )
        .await?;

    // Send your funds to the below bitcoin address
    let address = swap_info.bitcoin_address;
    // ANCHOR_END: generate-receive-onchain-address

    Ok(())
}

async fn get_in_progress_swap(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: in-progress-swap
    let swap_info = sdk.in_progress_swap().await?;
    // ANCHOR_END: in-progress-swap

    Ok(())
}

async fn list_refundables(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: list-refundables
    let refundables = sdk.list_refundables().await?;
    // ANCHOR_END: list-refundables

    Ok(())
}

async fn execute_refund(sdk: Arc<BreezServices>, refund_tx_fee_rate: u32, refundable: SwapInfo) -> Result<()> {
    // ANCHOR: execute-refund
    let destination_address = "...".into();
    let sat_per_vbyte = refund_tx_fee_rate;
    sdk.refund(refundable.bitcoin_address, destination_address, sat_per_vbyte).await?;
    // ANCHOR_END: execute-refund

    Ok(())
}

async fn get_channel_opening_fees(sdk: Arc<BreezServices>, amount_msat: u64) -> Result<()> {
    // ANCHOR: get-channel-opening-fees
    let channel_fees = sdk.open_channel_fee(
        OpenChannelFeeRequest { amount_msat, expiry: None })
        .await?;
    // ANCHOR_END: get-channel-opening-fees

    Ok(())
}