import {
  listPayments,
  PaymentTypeFilter
} from '@breeztech/react-native-breez-sdk'

const exampleListPayments = async () => {
  // ANCHOR: list-payments
  try {
    const payments = await listPayments({})
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: list-payments
}

const exampleListPaymentsFiltered = async () => {
  // ANCHOR: list-payments-filtered
  try {
    const payments = await listPayments({
      filters: [PaymentTypeFilter.SENT],
      fromTimestamp: 1696880000,
      includeFailures: true
    })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: list-payments-filtered
}
