import {
  prepareRedeemOnchainFunds,
  redeemOnchainFunds
  } from '@breeztech/react-native-breez-sdk'

  const prepareRedeemOnchainFunds = async (feeRate: number) => {
    // ANCHOR: prepare-redeem-onchain-funds
    const toAddress = "bc1.."
    const satPerVbyte = feeRate

    const prepareRedeemOnchainFundsResp = await prepareRedeemOnchainFunds({ toAddress, satPerVbyte })
    // ANCHOR_END: prepare-redeem-onchain-funds
  }

  const redeemOnchainFunds = async (satPerVbyte: number, toAddress: String) => {
    // ANCHOR: redeem-onchain-funds
    const redeemOnchainFundsResp = await redeemOnchainFunds({ toAddress, satPerVbyte })
     // ANCHOR_END: redeem-onchain-funds
  }