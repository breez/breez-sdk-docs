import { registerWebhook } from '@breeztech/react-native-breez-sdk'

const webhook = async () => {
  // ANCHOR: register-webook
  try {
    await registerWebhook('https://yourapplication.com')
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: register-webook
}

const paymentWebhook = async () => {
  // ANCHOR: register-payment-webook
  try {
    await registerWebhook('https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>')
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: register-payment-webook
}
