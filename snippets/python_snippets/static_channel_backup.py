import breez_sdk
import logging

sdk_services = breez_sdk.BlockingBreezServices


def retrieve_backup_files():
    try:
        # ANCHOR: static-channel-backup
        req = breez_sdk.StaticBackupRequest(working_dir="<working directory>")
        backup_data = breez_sdk.static_backup(req)
        # ANCHOR_END: static-channel-backup
        return backup_data
    except Exception as error:
        logging.error(error)
        raise