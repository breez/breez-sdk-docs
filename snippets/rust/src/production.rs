use anyhow::Result;
use breez_sdk_core::*;

fn production_node_config() -> Result<NodeConfig> {
    // ANCHOR: moving-to-production
    // Read your Greenlight credentials from secure storage
    let device_key: Vec<u8> = vec![];
    let device_cert: Vec<u8> = vec![];
    let greenlight_credentials = GreenlightCredentials {
        device_key,
        device_cert,
    };

    let node_config = NodeConfig::Greenlight {
        config: GreenlightNodeConfig {
            partner_credentials: Some(greenlight_credentials),
            invite_code: None,
        },
    };
    // ANCHOR_END: moving-to-production
    Ok(node_config)
}
