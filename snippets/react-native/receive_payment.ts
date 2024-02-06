import { receivePayment } from '@breeztech/react-native-breez-sdk'

const exampleReceiveLightningPayment = async () => {
  // ANCHOR: receive-payment
  try {
    const receivePaymentResponse = await receivePayment({
      amountMsat: 3_000_000,
      description: 'Invoice for 3000 sats'
    })

    const invoice = receivePaymentResponse.lnInvoice
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: receive-payment
}
