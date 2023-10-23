use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn buy(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: buy-btc
    let res = sdk.buy_bitcoin(
        BuyBitcoinRequest {
            provider: BuyBitcoinProvider::Moonpay,
            opening_fee_params: None})
        .await?;
    // ANCHOR_END: buy-btc

    Ok(())
}
