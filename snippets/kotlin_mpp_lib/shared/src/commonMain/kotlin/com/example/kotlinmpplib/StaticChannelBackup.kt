package com.example.kotlinmpplib

import breez_sdk.*
class StaticChannelBackup {
    fun backup(sdk: BlockingBreezServices) {
        // ANCHOR: static-channel-backup
        try {
            val backupData = staticBackup(StaticBackupRequest("<working directory>"))
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: static-channel-backup
    }
}