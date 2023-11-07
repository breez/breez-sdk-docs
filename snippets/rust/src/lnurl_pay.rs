use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;
use breez_sdk_core::InputType::LnUrlPay;

async fn pay(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: lnurl-pay
    // Endpoint can also be of the form:
    // lnurlp://domain.com/lnurl-pay?key=val
    // lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
    let lnurl_pay_url = "lightning@address.com";

    if let Ok(LnUrlPay{data: pd}) = parse(lnurl_pay_url).await {
        let amount_msat = pd.min_sendable;
        let comment = "Test payment".to_string();

        sdk.lnurl_pay(LnUrlPayRequest {
            data: pd,
            amount_msat,
            comment: Some(comment)
        }).await?;
    }
    // ANCHOR_END: lnurl-pay

    Ok(())
}
