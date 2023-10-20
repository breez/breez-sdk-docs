use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn generate_receive_onchain_address(sdk: Arc<BreezServices>) -> Result<()> {
    let swap_info = sdk.receive_onchain(
        ReceiveOnchainRequest { opening_fee_params: None } )
        .await?;

    // Send your funds to the below bitcoin address
    let address = swap_info.bitcoin_address;

    Ok(())
}

async fn get_in_progress_swap(sdk: Arc<BreezServices>) -> Result<()> {
    let swap_info = sdk.in_progress_swap().await?;

    Ok(())
}

async fn list_refundables(sdk: Arc<BreezServices>) -> Result<()> {
    let refundables = sdk.list_refundables().await?;

    Ok(())
}

async fn execute_refund(sdk: Arc<BreezServices>, refund_tx_fee_rate: u32, refundable: SwapInfo) -> Result<()> {
    let destination_address = "...".into();
    let sat_per_vbyte = refund_tx_fee_rate;
    sdk.refund(refundable.bitcoin_address, destination_address, sat_per_vbyte).await?;

    Ok(())
}

async fn get_channel_opening_fees(sdk: Arc<BreezServices>, amount_msat: u64) -> Result<()> {
    let channel_fees = sdk.open_channel_fee(
        OpenChannelFeeRequest { amount_msat, expiry: None })
        .await?;

    Ok(())
}