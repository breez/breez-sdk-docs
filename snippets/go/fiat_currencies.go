package example

import (
	"log"
)

func ListFiatCurrencies() {
	// ANCHOR: list-fiat-currencies
	fiatCurrencies, err := sdk.ListFiatCurrencies()
	if err != nil {
		return err
	}
	log.Printf("%#v", fiatCurrencies)
	// ANCHOR_END: list-fiat-currencies
}

func FetchFiatRates() {
	// ANCHOR: fetch-fiat-rates
	fiatRates, err := sdk.FetchFiatRates()
	if err != nil {
		return err
	}
	log.Printf("%#v", fiatRates)
	// ANCHOR_END: fetch-fiat-rates
}
