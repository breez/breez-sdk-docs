import {
  listFiatCurrencies,
  fetchFiatRates
} from '@breeztech/react-native-breez-sdk'

const exampleListCurrencies = async () => {
  // ANCHOR: list-fiat-currencies
  try {
    const fiatCurrencies = await listFiatCurrencies()
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: list-fiat-currencies
}

const exampleFetchRates = async () => {
  // ANCHOR: fetch-fiat-rates
  try {
    const fiatRates = await fetchFiatRates()
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: fetch-fiat-rates
}
