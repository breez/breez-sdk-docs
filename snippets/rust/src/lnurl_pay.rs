use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::InputType::LnUrlPay;
use breez_sdk_core::*;

async fn pay(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: lnurl-pay
    // Endpoint can also be of the form:
    // lnurlp://domain.com/lnurl-pay?key=val
    // lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
    let lnurl_pay_url = "lightning@address.com";

    if let Ok(LnUrlPay { data, .. }) = parse(lnurl_pay_url, None).await {
        let amount_msat = data.min_sendable;
        let use_trampoline = true;
        let optional_comment = Some("<comment>".to_string());
        let optional_payment_label = Some("<label>".to_string());

        sdk.lnurl_pay(LnUrlPayRequest {
            data,
            amount_msat,
            use_trampoline,
            comment: optional_comment,
            payment_label: optional_payment_label,
            validate_success_action_url: Some(true),
        })
        .await?;
    }
    // ANCHOR_END: lnurl-pay

    Ok(())
}
