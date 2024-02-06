import { staticBackup } from '@breeztech/react-native-breez-sdk'

const exampleStaticBackup = async () => {
  // ANCHOR: static-channel-backup
  try {
    const backupData = await staticBackup({ workingDir: '<working directory>' })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: static-channel-backup
}
