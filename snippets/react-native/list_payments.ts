import {
  listPayments,
  PaymentTypeFilter
} from "@breeztech/react-native-breez-sdk"

const exampleListPayments = async () => {
  // ANCHOR: list-payments
  const payments = listPayments({})
  // ANCHOR_END: list-payments
}

const exampleListPaymentsFiltered = async () => {
  // ANCHOR: list-payments-filtered
  const payments = listPayments({
    filters: [PaymentTypeFilter.SENT],
    fromTimestamp: 1696880000,
    includeFailures: true
  })
  // ANCHOR_END: list-payments-filtered
}
