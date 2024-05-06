import {
  inProgressSwap,
  listRefundables,
  openChannelFee,
  receiveOnchain,
  refund,
  rescanSwaps
} from '@breeztech/react-native-breez-sdk'

const exampleReceiveOnchain = async () => {
  // ANCHOR: generate-receive-onchain-address
  try {
    const swapInfo = await receiveOnchain({})

    // Send your funds to the below bitcoin address
    const address = swapInfo.bitcoinAddress
    console.log(`Minimum amount allowed to deposit in sats: ${swapInfo.minAllowedDeposit}`)
    console.log(`Maximum amount allowed to deposit in sats: ${swapInfo.maxAllowedDeposit}`)
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: generate-receive-onchain-address
}

const exampleInProgressSwap = async () => {
  // ANCHOR: in-progress-swap
  try {
    const swapInfo = await inProgressSwap()
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: in-progress-swap
}

const exampleListRefundables = async () => {
  // ANCHOR: list-refundables
  try {
    const refundables = await listRefundables()
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: list-refundables
}

const exampleRefund = async () => {
  // ANCHOR: execute-refund
  try {
    const refundables = await listRefundables()
    const toAddress = '...'
    const satPerVbyte = 5

    const refundResponse = await refund({
      swapAddress: refundables[0].bitcoinAddress,
      toAddress,
      satPerVbyte
    })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: execute-refund
}

const exampleOpenChannelFee = async () => {
  // ANCHOR: get-channel-opening-fees
  try {
    const amountMsat = 10000
    const openChannelFeeResponse = await openChannelFee({
      amountMsat
    })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: get-channel-opening-fees
}

const exampleRescanSwaps = async () => {
  // ANCHOR: rescan-swaps
  try {
    await rescanSwaps()
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: rescan-swaps
}
