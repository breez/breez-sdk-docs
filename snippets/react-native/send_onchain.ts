import {
  type ReverseSwapPairInfo,
  fetchReverseSwapFees,
  inProgressReverseSwaps,
  sendOnchain,
  maxReverseSwapAmount
} from '@breeztech/react-native-breez-sdk'

const exampleFetchReverseSwapFees = async () => {
  // ANCHOR: estimate-current-reverse-swap-total-fees
  try {
    const currentFees = await fetchReverseSwapFees({ sendAmountSat: 50000 })

    console.log(
      `Total estimated fees for reverse swap: ${currentFees.totalEstimatedFees}`
    )
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: estimate-current-reverse-swap-total-fees
}

const exampleListCurrentFees = (currentFees: ReverseSwapPairInfo) => {
  // ANCHOR: get-current-reverse-swap-min-max
  console.log(`Minimum amount, in sats: ${currentFees.min}`)
  console.log(`Maximum amount, in sats: ${currentFees.max}`)
  // ANCHOR_END: get-current-reverse-swap-min-max
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
