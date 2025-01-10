package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func RetrieveBackupFiles() error {
	// ANCHOR: static-channel-backup
	workingDir := "<working directory>"
	staticBackupResponse, err := breez_sdk.StaticBackup(breez_sdk.StaticBackupRequest{WorkingDir: workingDir})
	if err != nil {
		return err
	}
	log.Printf("%#v", staticBackupResponse)
	// ANCHOR_END: static-channel-backup
	return nil
}
