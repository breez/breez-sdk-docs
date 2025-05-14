use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::InputType::LnUrlWithdraw;
use breez_sdk_core::*;

async fn withdraw(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: lnurl-withdraw
    // Endpoint can also be of the form:
    // lnurlw://domain.com/lnurl-withdraw?key=val
    let lnurl_withdraw_url = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk";

    if let Ok(LnUrlWithdraw { data }) = parse(lnurl_withdraw_url, None).await {
        let amount_msat = data.min_withdrawable;
        let description = "Test withdraw".to_string();

        sdk.lnurl_withdraw(LnUrlWithdrawRequest {
            data,
            amount_msat,
            description: Some(description),
        })
        .await?;
    }
    // ANCHOR_END: lnurl-withdraw

    Ok(())
}
