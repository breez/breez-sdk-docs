package example

import (
	"log"
)

func ListFiatCurrencies() error {
	// ANCHOR: list-fiat-currencies
	fiatCurrencies, err := sdk.ListFiatCurrencies()
	if err != nil {
		return err
	}
	log.Printf("%#v", fiatCurrencies)
	// ANCHOR_END: list-fiat-currencies
	return nil
}

func FetchFiatRates() error {
	// ANCHOR: fetch-fiat-rates
	fiatRates, err := sdk.FetchFiatRates()
	if err != nil {
		return err
	}
	log.Printf("%#v", fiatRates)
	// ANCHOR_END: fetch-fiat-rates
	return nil
}
