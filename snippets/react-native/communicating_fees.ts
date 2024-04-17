import {
  receivePayment,
  type ReceivePaymentResponse
} from '@breeztech/react-native-breez-sdk'

const getFeeInfoAfterInvoiceCreated = async (receivePaymentResponse: ReceivePaymentResponse) => {
  // ANCHOR: get-fee-info-after-invoice-created
  const openingFeeMsat = receivePaymentResponse.openingFeeMsat
  const openingFeeSat = openingFeeMsat ?? openingFeeMsat / 1000 : 0
  console.log(`A setup fee of ${openingFeeSat} sats is applied to this invoice.`)
  // ANCHOR_END: get-fee-info-after-invoice-created
}
