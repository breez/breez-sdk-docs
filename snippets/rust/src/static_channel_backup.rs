use anyhow::Result;
use breez_sdk_core::*;

async fn retrieve_backup_files() -> Result<()> {
    let backup_data = BreezServices::static_backup(StaticBackupRequest {
        working_dir: "<working directory>".into(),
    })?;

    Ok(())
}
