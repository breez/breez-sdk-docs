import {
  prepareRedeemOnchainFunds,
  redeemOnchainFunds
} from '@breeztech/react-native-breez-sdk'

const examplePrepareRedeemOnchainFunds = async (feeRate: number) => {
  // ANCHOR: prepare-redeem-onchain-funds
  try {
    const toAddress = 'bc1..'
    const satPerVbyte = feeRate
    const prepareRedeemOnchainFundsResp = await prepareRedeemOnchainFunds({ toAddress, satPerVbyte })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: prepare-redeem-onchain-funds
}

const exampleRedeemOnchainFunds = async (satPerVbyte: number, toAddress: string) => {
  // ANCHOR: redeem-onchain-funds
  try {
    const redeemOnchainFundsResp = await redeemOnchainFunds({ toAddress, satPerVbyte })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: redeem-onchain-funds
}
