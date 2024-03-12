use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;
use log::info;

async fn get_current_limits(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: get-current-reverse-swap-limits
    let current_limits = sdk.onchain_payment_limits().await?;

    info!("Minimum amount: {} sats", current_limits.min_sat);
    info!("Maximum amount: {} sats", current_limits.max_sat);
    // ANCHOR_END: get-current-reverse-swap-limits

    Ok(())
}

async fn max_reverse_swap_amount(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: max-reverse-swap-amount
    let max_amount = sdk.max_reverse_swap_amount().await?;

    info!("Max reverse swap amount: {:?}", max_amount.total_sat);
    // ANCHOR_END: max-reverse-swap-amount

    Ok(())
}

async fn prepare_pay_onchain(
    sdk: Arc<BreezServices>,
    current_limits: OnchainPaymentLimitsResponse,
    fee_rate: u32,
) -> Result<()> {
    // ANCHOR: prepare-pay-onchain
    let amount_sat = current_limits.min_sat;
    let claim_tx_feerate = fee_rate;

    let prepare_res = sdk
        .prepare_onchain_payment(PrepareOnchainPaymentRequest {
            amount_sat,
            amount_type: SwapAmountType::Send,
            claim_tx_feerate,
        })
        .await?;

    info!("Send amount: {} sats", prepare_res.sender_amount_sat);
    info!("Receive amount: {} sats", prepare_res.recipient_amount_sat);
    info!("Total fees: {} sats", prepare_res.total_fees);
    // ANCHOR_END: prepare-pay-onchain

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
