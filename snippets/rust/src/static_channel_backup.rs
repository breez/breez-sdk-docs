use anyhow::Result;
use breez_sdk_core::*;

async fn retrieve_backup_files() -> Result<()> {
    // ANCHOR: static-channel-backup
    let backup_data = BreezServices::static_backup(StaticBackupRequest {
        working_dir: "<working directory>".into(),
    })?;
    // ANCHOR_END: static-channel-backup

    Ok(())
}
