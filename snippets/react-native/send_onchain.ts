import {
  type ReverseSwapPairInfo,
  type OnchainPaymentLimitsResponse,
  fetchReverseSwapFees,
  inProgressReverseSwaps,
  onchainPaymentLimits,
  prepareOnchainPayment,
  sendOnchain,
  SwapAmountType,
  maxReverseSwapAmount
} from '@breeztech/react-native-breez-sdk'

const exampleFetchReverseSwapLimits = async () => {
  // ANCHOR: get-current-reverse-swap-limits
  try {
    const currentLimits = await onchainPaymentLimits()

    console.log(`Minimum amount, in sats: ${currentLimits.minSat}`)
    console.log(`Maximum amount, in sats: ${currentLimits.maxSat}`)
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: get-current-reverse-swap-limits
}

const examplePreparePayOnchain = async (currentLimits: OnchainPaymentLimitsResponse) => {
  // ANCHOR: prepare-pay-onchain
  try {
    const amountSat = currentLimits.minSat
    const satPerVbyte = 10

    const prepareResponse = await prepareOnchainPayment({
      amountSat,
      amountType: SwapAmountType.SEND,
      claimTxFeerate: satPerVbyte
    })
    console.log(`Sender amount: ${prepareResponse.senderAmountSat} sats`)
    console.log(`Recipient amount: ${prepareResponse.recipientAmountSat} sats`)
    console.log(`Total fees: ${prepareResponse.totalFees} sats`)
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: prepare-pay-onchain
}

const examplePayOnchain = async (prepareRes: PrepareOnchainPaymentResponse) => {
  // ANCHOR: start-reverse-swap
  try {
    const onchainRecipientAddress = 'bc1..'

    const reverseSwapInfo = await payOnchain({
      recipientAddress: onchainRecipientAddress,
      prepareRes
    })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: start-reverse-swap
}

const exampleInProgressReverseSwaps = async () => {
  // ANCHOR: check-reverse-swaps-status
  try {
    const swaps = await inProgressReverseSwaps()
    for (const swap of swaps) {
      console.log(
        `Reverse swap ${swap.id} in progress, status is ${swap.status}`
      )
    }
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: check-reverse-swaps-status
}
