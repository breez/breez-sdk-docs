use std::sync::Arc;
use std::{fs, path::PathBuf};

use anyhow::Result;
use bip39::{Language, Mnemonic};
use breez_sdk_core::*;

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
    let connect_request = ConnectRequest {
        config,
        seed: seed.to_vec(),
        restore_only: None,
    };
    let sdk = BreezServices::connect(connect_request, Box::new(AppEventListener {})).await?;
    // ANCHOR_END: init-sdk

    Ok(sdk)
}

async fn getting_started_restore_only(config: Config, seed: Vec<u8>) -> Result<Arc<BreezServices>> {
    // ANCHOR: init-sdk-restore-only
    let connect_request = ConnectRequest {
        config,
        seed,
        restore_only: Some(true),
    };
    let sdk = BreezServices::connect(connect_request, Box::new(AppEventListener {})).await?;
    // ANCHOR_END: init-sdk-restore-only
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

async fn getting_started_logging(data_dir: String) -> Result<()> {
    // ANCHOR: logging
    let data_dir_path = PathBuf::from(&data_dir);
    fs::create_dir_all(data_dir_path)?;

    BreezServices::init_logging(&data_dir, None)?;
    // ANCHOR_END: logging

    Ok(())
}
