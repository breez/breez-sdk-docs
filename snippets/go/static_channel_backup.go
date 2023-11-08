package example

import (
    "log"

    "github.com/breez/breez-sdk-go/breez_sdk"
)

func RetrieveBackupFiles() {
    // ANCHOR: static-channel-backup
    workingDir := "<working directory>"
    if staticBackupResponse, err := breez_sdk.StaticBackup(breez_sdk.StaticBackupRequest{WorkingDir: workingDir}); err == nil {
        log.Printf("%#v", staticBackupResponse)
    }
    // ANCHOR_END: static-channel-backup
}
