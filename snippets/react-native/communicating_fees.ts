import { receivePayment } from '@breeztech/react-native-breez-sdk'

const get_fee_info_after_invoice_created = async (receivePaymentResponse: ReceivePaymentResponse) => {
  // ANCHOR: get-fee-info-after-invoice-created
  const openingFeeMsat = receivePaymentResponse.openingFeeMsat
  const openingFeeSat = openingFeeMsat ? openingFeeMsat / 1000 : 0
  console.log(`A setup fee of ${openingFeeSat} sats is applied to this invoice.`)
  // ANCHOR_END: get-fee-info-after-invoice-created
}