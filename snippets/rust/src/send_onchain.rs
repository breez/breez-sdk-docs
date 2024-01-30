use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;
use log::info;

async fn get_current_fees(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: estimate-current-reverse-swap-total-fees
    let current_fees = sdk
        .fetch_reverse_swap_fees(ReverseSwapFeesRequest {
            send_amount_sat: Some(50_000),
        })
        .await?;

    info!(
        "Total estimated fees for reverse swap: {:?}",
        current_fees.total_estimated_fees
    );
    // ANCHOR_END: estimate-current-reverse-swap-total-fees

    Ok(())
}

async fn list_current_fees(current_fees: ReverseSwapPairInfo) -> Result<()> {
    // ANCHOR: get-current-reverse-swap-min-max
    info!("Minimum amount, in sats: {}", current_fees.min);
    info!("Maximum amount, in sats: {}", current_fees.max);
    // ANCHOR_END: get-current-reverse-swap-min-max

    Ok(())
}

async fn max_reverse_swap_amount(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: max-reverse-swap-amount
    let max_amount = sdk.max_reverse_swap_amount().await?;

    info!("Max reverse swap amount: {:?}", max_amount.total_sat);
    // ANCHOR_END: max-reverse-swap-amount

    Ok(())
}

async fn start_reverse_swap(
    sdk: Arc<BreezServices>,
    current_fees: ReverseSwapPairInfo,
    fee_rate: u32,
) -> Result<()> {
    // ANCHOR: start-reverse-swap
    let destination_address = String::from("bc1..");
    let amount_sat = current_fees.min;
    let sat_per_vbyte = fee_rate;

    sdk.send_onchain(SendOnchainRequest {
        pair_hash: current_fees.fees_hash,
        amount_sat,
        sat_per_vbyte,
        onchain_recipient_address: destination_address,
    })
    .await?;
    // ANCHOR_END: start-reverse-swap

    Ok(())
}

async fn check_reverse_swap_status(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: check-reverse-swaps-status
    for rs in sdk.in_progress_reverse_swaps().await? {
        info!(
            "Reverse swap {} in progress, status is {:?}",
            rs.id, rs.status
        );
    }
    // ANCHOR_END: check-reverse-swaps-status

    Ok(())
}
