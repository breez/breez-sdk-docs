import { sendPayment } from '@breeztech/react-native-breez-sdk'

const exampleSendLightningPayment = async () => {
  // ANCHOR: send-payment
  try {
    const bolt11 = 'bolt11 invoice'
    const useTrampoline = false
    // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
    // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
    const optionalAmountMsat = 3000000
    const optionalLabel = '<label>'
    const response = await sendPayment({
      bolt11,
      useTrampoline,
      amountMsat: optionalAmountMsat,
      label: optionalLabel
    })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: send-payment
}
