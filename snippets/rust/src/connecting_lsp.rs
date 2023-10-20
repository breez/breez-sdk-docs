use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;

async fn get_lsp_info(sdk: Arc<BreezServices>) -> Result<LspInformation> {
    let lsp_id = sdk.lsp_id().await?;
    let lsp_info = sdk.lsp_info().await?;

    Ok(lsp_info)
}

async fn connect_lsp(sdk: Arc<BreezServices>, lsp_id: String) -> Result<()> {
    sdk.connect_lsp(lsp_id).await?;

    Ok(())
}