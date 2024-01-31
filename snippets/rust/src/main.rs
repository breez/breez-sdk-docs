mod buy_btc;
mod closed_channel;
mod connecting_lsp;
mod fiat_currencies;
mod getting_started;
mod list_payments;
mod lnurl_auth;
mod lnurl_pay;
mod lnurl_withdraw;
mod production;
mod receive_onchain;
mod receive_payment;
mod send_onchain;
mod send_payment;
mod send_spontaneous_payment;
mod service_status;
mod static_channel_backup;
mod webhook;

use anyhow::Result;
use breez_sdk_core::*;
use log::info;

struct AppEventListener {}
impl EventListener for AppEventListener {
    fn on_event(&self, e: BreezEvent) {
        info!("Received Breez event: {e:?}");
    }
}

#[tokio::main]
async fn main() -> Result<()> {
    Ok(())
}
