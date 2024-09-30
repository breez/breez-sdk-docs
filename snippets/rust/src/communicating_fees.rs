use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;
use log::info;

async fn get_fee_info_before_receiving_payment(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: get-fee-info-before-receiving-payment
    let inbound_liquidity_msat = sdk.node_info()?.max_receivable_single_payment_amount_msat;
    let inbound_liquidity_sat = inbound_liquidity_msat / 1000;

    let opening_fee_response = sdk
        .open_channel_fee(OpenChannelFeeRequest::default())
        .await?;

    let opening_fees = opening_fee_response.fee_params;
    let fee_percentage = (opening_fees.proportional * 100) as f64 / 1_000_000_f64;
    let min_fee_sat = opening_fees.min_msat / 1_000;

    if inbound_liquidity_sat == 0 {
        info!("A setup fee of {fee_percentage}% with a minimum of {min_fee_sat} sats will be applied.");
    } else {
        info!("A setup fee of {fee_percentage}% with a minimum of {min_fee_sat} sats will be applied for receiving more than {inbound_liquidity_sat} sats.");
    }
    // ANCHOR_END: get-fee-info-before-receiving-payment

    Ok(())
}

async fn get_fee_info_after_invoice_created(
    receive_payment_response: ReceivePaymentResponse,
) -> Result<()> {
    // ANCHOR: get-fee-info-after-invoice-created
    let opening_fee_sat = receive_payment_response
        .opening_fee_msat
        .unwrap_or_default()
        / 1000;
    info!("A setup fee of {opening_fee_sat} sats is applied to this invoice.");
    // ANCHOR_END: get-fee-info-after-invoice-created

    Ok(())
}

async fn get_fee_info_receive_onchain(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: get-fee-info-receive-onchain
    let swap_info = sdk
        .receive_onchain(ReceiveOnchainRequest::default())
        .await?;

    let min_deposit_sat = swap_info.min_allowed_deposit;
    let max_deposit_sat = swap_info.max_allowed_deposit;
    let inbound_liquidity_sat = sdk.node_info()?.max_receivable_single_payment_amount_msat / 1000;

    if let Some(swap_opening_fees) = swap_info.channel_opening_fees {
        let fee_percentage = (swap_opening_fees.proportional * 100) as f64 / 1_000_000_f64;
        let min_fee_sat = swap_opening_fees.min_msat / 1_000;

        info!("Send more than {min_deposit_sat} sats and up to {max_deposit_sat} sats to this address. \
            A setup fee of {fee_percentage}% with a minimum of {min_fee_sat} sats will be applied \
            for sending more than {inbound_liquidity_sat} sats. This address can only be used once.");
    }
    // ANCHOR_END: get-fee-info-receive-onchain

    Ok(())
}
