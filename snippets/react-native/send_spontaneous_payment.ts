import {
  sendSpontaneousPayment,
  type TlvEntry
} from '@breeztech/react-native-breez-sdk'

const exampleSendSpontaneousPayment = async () => {
  // ANCHOR: send-spontaneous-payment
  const nodeId = '...'

  const sendPaymentResponse = await sendSpontaneousPayment({
    nodeId,
    amountMsat: 3000000
  })
  // ANCHOR_END: send-spontaneous-payment
}

const stringToBytes = (str: string): number[] => {
  const bytes: number[] = []
  for (let i = 0; i < str.length; ++i) {
    bytes.push(str.charCodeAt(i))
  }
  return bytes
}

const exampleSendSpontaneousPaymentWithTlvs = async () => {
  // ANCHOR: send-spontaneous-payment-with-tlvs
  const nodeId = '...'
  const extraTlvs: TlvEntry[] = [
    { fieldNumber: 34349334, value: stringToBytes('Hello world!') }
  ]

  const sendPaymentResponse = await sendSpontaneousPayment({
    nodeId,
    amountMsat: 3000000,
    extraTlvs
  })
  // ANCHOR_END: send-spontaneous-payment-with-tlvs
}
