use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::InputType::LnUrlAuth;
use breez_sdk_core::*;
use log::{error, info};

async fn auth(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: lnurl-auth
    // Endpoint can also be of the form:
    // keyauth://domain.com/auth?key=val
    let lnurl_auth_url = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttvdankjm3lw3skw0tvdankjm3xdvcn6vtp8q6n2dfsx5mrjwtrxdjnqvtzv56rzcnyv3jrxv3sxqmkyenrvv6kve3exv6nqdtyv43nqcmzvdsnvdrzx33rsenxx5unqc3cxgeqgntfgu";

    if let Ok(LnUrlAuth { data }) = parse(lnurl_auth_url).await {
        match sdk.lnurl_auth(data).await {
            Ok(LnUrlCallbackStatus::Ok) => {
                info!("Successfully authenticated")
            }
            Ok(LnUrlCallbackStatus::ErrorStatus { data }) => {
                error!("Failed to authenticate: {}", data.reason)
            }
            Err(e) => {
                error!("Failed to connect: {e}")
            }
        }
    }
    // ANCHOR_END: lnurl-auth

    Ok(())
}
