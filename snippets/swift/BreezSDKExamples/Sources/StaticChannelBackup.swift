//
//  StaticChannelBackup.swift
//  BreezSDKDocs
//
//  Created by ruben on 14/11/2023.
//

import BreezSDK
import Foundation

func retrieveBackupFiles() -> StaticBackupResponse? {
    // ANCHOR: static-channel-backup
    let backupData = try? staticBackup(req: StaticBackupRequest(workingDir: "<working directory>"))
    // ANCHOR_END: static-channel-backup
    return backupData
}
