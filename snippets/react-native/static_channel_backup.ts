import { staticBackup } from '@breeztech/react-native-breez-sdk'

const exampleStaticBackup = async () => {
  // ANCHOR: static-channel-backup
  const backupData = await staticBackup({ workingDir: '<working directory>' })
  // ANCHOR_END: static-channel-backup
}
