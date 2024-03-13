import {
  type ReverseSwapPairInfo,
  fetchReverseSwapFees,
  inProgressReverseSwaps,
  onchainPaymentLimits,
  sendOnchain,
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

const maxAmount = async () => {
  // ANCHOR: max-reverse-swap-amount
  try {
    const maxAmount = await maxReverseSwapAmount()

    console.log(
      `Max reverse swap amount: ${maxAmount.totalSat}`
    )
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: max-reverse-swap-amount
}

const exampleSendOnchain = async (currentFees: ReverseSwapPairInfo) => {
  // ANCHOR: start-reverse-swap
  try {
    const onchainRecipientAddress = 'bc1..'
    const amountSat = currentFees.min
    const satPerVbyte = 5

    const reverseSwapInfo = await sendOnchain({
      amountSat,
      onchainRecipientAddress,
      pairHash: currentFees.feesHash,
      satPerVbyte
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
