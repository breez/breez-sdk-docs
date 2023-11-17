use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn get_lsp_info(sdk: Arc<BreezServices>) -> Result<LspInformation> {
    // ANCHOR: get-lsp-info
    let lsp_id = sdk.lsp_id().await?;
    let lsp_info = sdk.lsp_info().await?;
    // ANCHOR_END: get-lsp-info

    Ok(lsp_info)
}

async fn list_lsps(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: list-lsps
    let available_lsps = sdk.list_lsps().await?;
    // ANCHOR_END: list-lsps

    Ok(())
}

async fn connect_lsp(sdk: Arc<BreezServices>, lsp_id: String) -> Result<()> {
    // ANCHOR: connect-lsp
    sdk.connect_lsp(lsp_id).await?;
    // ANCHOR_END: connect-lsp

    Ok(())
}
