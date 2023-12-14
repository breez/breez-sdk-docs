import { registerWebhook } from '@breeztech/react-native-breez-sdk'

const webhook = async () => {
  // ANCHOR: register-webook
  await registerWebhook('https://yourapplication.com')
  // ANCHOR_END: register-webook
}

const paymentWebhook = async () => {
  // ANCHOR: register-payment-webook
  await registerWebhook('https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>')
  // ANCHOR_END: register-payment-webook
}
