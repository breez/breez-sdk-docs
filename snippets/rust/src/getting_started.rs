use anyhow::Result;
use bip39::{Language, Mnemonic};
use breez_sdk_core::*;
use std::sync::Arc;

use crate::AppEventListener;

async fn getting_started() -> Result<Arc<BreezServices>> {
    // ANCHOR: init-sdk
    let mnemonic = Mnemonic::generate_in(Language::English, 12)?;
    let seed = mnemonic.to_seed("");
    let invite_code = Some("<invite code>".into());
    let api_key = "<api key>".into();

    // Create the default config
    let mut config = BreezServices::default_config(
        EnvironmentType::Production,
        api_key,
        breez_sdk_core::NodeConfig::Greenlight {
            config: GreenlightNodeConfig {
                partner_credentials: None,
                invite_code,
            },
        },
    );

    // Customize the config object according to your needs
    config.working_dir = "path to an existing directory".into();

    // Connect to the Breez SDK make it ready for use
    let sdk = BreezServices::connect(config, seed.to_vec(), Box::new(AppEventListener {})).await?;
    // ANCHOR_END: init-sdk

    Ok(sdk)
}

async fn getting_started_node_info(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: fetch-balance
    let node_state = sdk.node_info()?;
    let balance_ln = node_state.channels_balance_msat;
    let balance_onchain = node_state.onchain_balance_msat;
    // ANCHOR_END: fetch-balance

    Ok(())
}
