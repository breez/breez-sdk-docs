import { registerWebhook, unregisterWebhook } from '@breeztech/react-native-breez-sdk'

const _registerWebhook = async () => {
  // ANCHOR: register-webook
  try {
    await registerWebhook('https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>')
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: register-webook
}

const _unregisterWebhook = async () => {
  // ANCHOR: unregister-webook
  try {
    await unregisterWebhook('https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>')
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: unregister-webook
}
