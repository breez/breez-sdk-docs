import {
    listFiatCurrencies,
    fetchFiatRates
} from "@breeztech/react-native-breez-sdk"

const exampleListCurrencies = async () => {
    // ANCHOR: list-fiat-currencies
    const fiatCurrencies = await listFiatCurrencies()
    // ANCHOR_END: list-fiat-currencies
}

const exampleFetchRates = async () => {
    // ANCHOR: fetch-fiat-rates
    const fiatRates = await fetchFiatRates()
    // ANCHOR_END: fetch-fiat-rates
}

const exampleListCurrenciesAndRates = async () => {
    // ANCHOR: get-fiat-currencies-and-rates
    // TODO
    // ANCHOR_END: get-fiat-currencies-and-rates
}
