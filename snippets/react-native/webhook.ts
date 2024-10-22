import { registerWebhook, unregisterWebhook } from '@breeztech/react-native-breez-sdk'

const _registerWebhook = async () => {
  // ANCHOR: register-webook
  try {
    const url = 'https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>'
    await registerWebhook(url)
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: register-webook
}

const _unregisterWebhook = async () => {
  // ANCHOR: unregister-webook
  try {
    const url = 'https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>'
    await unregisterWebhook(url)
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: unregister-webook
}
