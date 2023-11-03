import breez_sdk

def retrieve_backup_files(sdk_services, working_dir):
    try:
        # ANCHOR: static-channel-backup
        req = breez_sdk.StaticBackupRequest(working_dir=working_dir)
        backup_data = breez_sdk.static_backup(req)
        # ANCHOR_END: static-channel-backup
        return backup_data
    except Exception as error:
        print(error)
        raise