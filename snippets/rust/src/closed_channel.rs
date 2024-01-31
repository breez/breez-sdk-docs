use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn prepare_redeem_onchain_funds(sdk: Arc<BreezServices>, fee_rate: u32) -> Result<()> {
    // ANCHOR: prepare-redeem-onchain-funds
    let sat_per_vbyte = fee_rate;
    let destination_address = String::from("bc1..");
    sdk.prepare_redeem_onchain_funds(PrepareRedeemOnchainFundsRequest {
        sat_per_vbyte,
        to_address: destination_address,
    })
    .await?;
    // ANCHOR_END: prepare-redeem-onchain-funds
    Ok(())
}

async fn redeem_onchain_funds(
    sdk: Arc<BreezServices>,
    sat_per_vbyte: u32,
    to_address: String,
) -> Result<()> {
    // ANCHOR: redeem-onchain-funds
    sdk.redeem_onchain_funds(RedeemOnchainFundsRequest {
        sat_per_vbyte,
        to_address,
    })
    .await?;
    // ANCHOR_END: redeem-onchain-funds
    Ok(())
}
