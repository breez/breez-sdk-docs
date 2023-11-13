import { sendPayment } from '@breeztech/react-native-breez-sdk'

const exampleSendLightningPayment = async (bolt11: string) => {
  // ANCHOR: send-payment
  // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
  // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
  const amountMsat = 3000000
  const response = await sendPayment({ bolt11, amountMsat })
  // ANCHOR_END: send-payment
}
