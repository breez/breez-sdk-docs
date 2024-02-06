import {
  buyBitcoin,
  BuyBitcoinProvider
} from '@breeztech/react-native-breez-sdk'

const exampleBuyBtc = async () => {
  // ANCHOR: buy-btc
  try {
    const buyBitcoinResponse = await buyBitcoin({
      provider: BuyBitcoinProvider.MOONPAY
    })
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: buy-btc
}
