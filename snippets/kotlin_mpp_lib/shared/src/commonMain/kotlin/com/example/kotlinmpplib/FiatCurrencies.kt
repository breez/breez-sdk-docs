package com.example.kotlinmpplib

import breez_sdk.*

class FiatCurrencies {
    fun list_fiat_currencies(sdk: BlockingBreezServices) {
        // ANCHOR: list-fiat-currencies
        try {
            val fiatCurrencyList = sdk.listFiatCurrencies()
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: list-fiat-currencies
    }

    fun fetch_fiat_rates(sdk: BlockingBreezServices) {
        // ANCHOR: fetch-fiat-rates
        try {
            val fiatRatesMap = sdk.fetchFiatRates()
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: fetch-fiat-rates
    }

    fun get_fiat_currencies_and_rates(sdk: BlockingBreezServices) {
        // ANCHOR: get-fiat-currencies-and-rates
        fun fiatCurrenciesAndRate(): Map<FiatCurrency, Rate> = try {
            val fiatCurrencies = sdk.listFiatCurrencies()
            val fiatRates = sdk.fetchFiatRates()

            val ratesMap = mutableMapOf<String, Rate>()
            for (rate in fiatRates) {
                ratesMap[rate.coin.lowercase()] = rate
            }

            val sorted = fiatCurrencies.sortedBy { it.info.name }
            val result = LinkedHashMap<FiatCurrency, Rate>()
            for (currency in sorted) {
                val rate = ratesMap[currency.id.lowercase()]
                if (rate != null) {
                    result[currency] = rate
                }
            }

            result
        } catch (e: Throwable) {
            // Handle error
            emptyMap()
        }
        // ANCHOR_END: get-fiat-currencies-and-rates
    }
}