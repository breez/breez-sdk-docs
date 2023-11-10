import {
  buyBitcoin,
  BuyBitcoinProvider
} from '@breeztech/react-native-breez-sdk'

const exampleBuyBtc = async () => {
  // ANCHOR: buy-btc
  const buyBitcoinResponse = await buyBitcoin({
    provider: BuyBitcoinProvider.MOONPAY
  })
  // ANCHOR_END: buy-btc
}
