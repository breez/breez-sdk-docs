use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;
use log::info;

async fn get_current_fees(sdk: Arc<BreezServices>) -> Result<()> {
    let current_fees = sdk.fetch_reverse_swap_fees(
        ReverseSwapFeesRequest {
            send_amount_sat: Some(50000),
        })
        .await?;

    info!("Total estimated fees for reverse swap: {:?}", current_fees.total_estimated_fees);

    Ok(())
}

async fn list_current_fees(sdk: Arc<BreezServices>, current_fees: ReverseSwapPairInfo) -> Result<()> {
    info!("Minimum amount, in sats: {}", current_fees.min);
    info!("Maximum amount, in sats: {}", current_fees.max);

    Ok(())
}

async fn start_reverse_swap(sdk: Arc<BreezServices>, current_fees: ReverseSwapPairInfo, fee_rate: u64) -> Result<()> {
    let destination_address = String::from("bc1..");
    let amount_sat = current_fees.min;
    let satPerVbyte = fee_rate;

    sdk.send_onchain(amount_sat, destination_address, current_fees.fees_hash, satPerVbyte).await?;

    Ok(())
}

async fn check_reverse_swap_status(sdk: Arc<BreezServices>) -> Result<()> {
    for rs in sdk.in_progress_reverse_swaps().await? {
        info!("Reverse swap {} in progress, status is {:?}", rs.id, rs.status);
    }

    Ok(())
}