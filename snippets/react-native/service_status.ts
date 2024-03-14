import { serviceHealthCheck, reportIssue, ReportIssueRequestVariant } from '@breeztech/react-native-breez-sdk'

const healthCheckStatus = async () => {
  // ANCHOR: health-check-status
  try {
    const healthCheck = await serviceHealthCheck('<api key>')
    console.log(`Current service status is: ${healthCheck.status}`)
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: health-check-status
}

const reportPaymentFailure = async () => {
  // ANCHOR: report-payment-failure
  try {
    const paymentHash = '...'
    await reportIssue({
      type: ReportIssueRequestVariant.PAYMENT_FAILURE,
      data: { paymentHash }
    })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: report-payment-failure
}
