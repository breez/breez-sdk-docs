package example

import (
    "log"
)

func ListFiatCurrencies() {
    // ANCHOR: list-fiat-currencies
    if fiatCurrencies, err := sdk.ListFiatCurrencies(); err == nil {
        log.Printf("%#v", fiatCurrencies)
    }
    // ANCHOR_END: list-fiat-currencies
}

func FetchFiatRates() {
    // ANCHOR: fetch-fiat-rates
    if fiatRates, err := sdk.FetchFiatRates(); err == nil {
        log.Printf("%#v", fiatRates)
    }
    // ANCHOR_END: fetch-fiat-rates
}

func GetFiatCurrenciesAndRates() {
    // ANCHOR: get-fiat-currencies-and-rates
    // TODO
    // ANCHOR_END: get-fiat-currencies-and-rates
}
