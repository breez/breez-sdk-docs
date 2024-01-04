import {
  prepareRedeemOnchainFunds,
  redeemOnchainFunds
  } from '@breeztech/react-native-breez-sdk'

  const examplePrepareRedeemOnchainFunds = async (feeRate: number) => {
    // ANCHOR: prepare-redeem-onchain-funds
    const toAddress = "bc1.."
    const satPerVbyte = feeRate

    const prepareRedeemOnchainFundsResp = await prepareRedeemOnchainFunds({ toAddress, satPerVbyte })
    // ANCHOR_END: prepare-redeem-onchain-funds
  }

  const exampleRedeemOnchainFunds = async (satPerVbyte: number, toAddress: string) => {
    // ANCHOR: redeem-onchain-funds
    const redeemOnchainFundsResp = await redeemOnchainFunds({ toAddress, satPerVbyte })
     // ANCHOR_END: redeem-onchain-funds
  }