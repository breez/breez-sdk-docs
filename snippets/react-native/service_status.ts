import { serviceHealthCheck, reportIssue, ReportIssueRequestVariant } from '@breeztech/react-native-breez-sdk'

const healthCheckStatus = async () => {
  // ANCHOR: health-check-status
  const healthCheck = await serviceHealthCheck()
  console.log(`Current service status is: ${healthCheck.status}`)
  // ANCHOR_END: health-check-status
}

const reportPaymentFailure = async () => {
  // ANCHOR: report-payment-failure
  const paymentHash = '...'
  await reportIssue({
    type: ReportIssueRequestVariant.PAYMENT_FAILURE,
    data: { paymentHash }
  })
  // ANCHOR_END: report-payment-failure
}
