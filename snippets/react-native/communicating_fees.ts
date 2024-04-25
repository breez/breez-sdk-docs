import {
  nodeInfo,
  openChannelFee,
  receiveOnchain,
  receivePayment,
  type ReceivePaymentResponse
} from '@breeztech/react-native-breez-sdk'

const getFeeInfoBeforeInvoiceCreated = async () => {
  // ANCHOR: get-fee-info-before-receiving-payment
  const nodeState = await nodeInfo()
  const inboundLiquidityMsat = nodeState.inboundLiquidityMsats
  const inboundLiquiditySat = inboundLiquidityMsat != null ? inboundLiquidityMsat / 1_000 : 0

  const openChannelFeeResponse = await openChannelFee()

  const openingFees = openChannelFeeResponse.feeParams
  const feePercentage = (openingFees.proportional * 100) / 1_000_000
  const minFeeSat = openingFees.minMsat / 1_000

  if (inboundLiquiditySat === 0) {
    console.log(`A setup fee of ${feePercentage}% with a minimum of ${minFeeSat} sats will be applied.`)
  } else {
    console.log(`A setup fee of ${feePercentage}% with a minimum of ${minFeeSat} sats will be applied for receiving more than ${inboundLiquiditySat} sats.`)
  }
  // ANCHOR_END: get-fee-info-before-receiving-payment
}

const getFeeInfoAfterInvoiceCreated = async (receivePaymentResponse: ReceivePaymentResponse) => {
  // ANCHOR: get-fee-info-after-invoice-created
  const openingFeeMsat = receivePaymentResponse.openingFeeMsat
  const openingFeeSat = openingFeeMsat != null ? openingFeeMsat / 1000 : 0
  console.log(`A setup fee of ${openingFeeSat} sats is applied to this invoice.`)
  // ANCHOR_END: get-fee-info-after-invoice-created
}

const getFeeInfoReceiveOnchain = async () => {
  // ANCHOR: get-fee-info-receive-onchain
  const nodeState = await nodeInfo()
  const swapInfo = await receiveOnchain({})

  const minDepositSat = swapInfo.minAllowedDeposit
  const maxDepositSat = swapInfo.maxAllowedDeposit
  const inboundLiquidityMsat = nodeState?.inboundLiquidityMsats
  const inboundLiquiditySat = inboundLiquidityMsat != null ? (inboundLiquidityMsat / 1_000) : 0

  const swapOpeningFees = swapInfo.channelOpeningFees
  if (swapOpeningFees != null) {
    const feePercentage = (swapOpeningFees.proportional * 100) / 1_000_000
    const minFeeSat = swapOpeningFees.minMsat / 1_000

    console.log(`Send more than ${minDepositSat} sats and up to ${maxDepositSat} sats to this address. A setup fee of ${feePercentage}% with a minimum of ${minFeeSat} sats will be applied for sending more than ${inboundLiquiditySat} sats. This address can only be used once.`)
  }
  // ANCHOR_END: get-fee-info-receive-onchain
}
