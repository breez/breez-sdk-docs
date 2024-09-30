use anyhow::Result;
use breez_sdk_core::*;

fn production_node_config() -> Result<NodeConfig> {
    // ANCHOR: moving-to-production
    // Read in your Greenlight credentials from the file
    // system, environment variable or build config
    let developer_key: Vec<u8> = vec![];
    let developer_cert: Vec<u8> = vec![];
    let greenlight_credentials = GreenlightCredentials {
        developer_key,
        developer_cert,
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
