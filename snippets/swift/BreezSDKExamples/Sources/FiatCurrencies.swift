//
//  FiatCurrencies.swift
//
//
//  Created by ruben on 14/11/2023.
//

import BreezSDK
import Foundation

func listSupportedFiatCurrencies(sdk: BlockingBreezServices) -> [FiatCurrency]? {
    // ANCHOR: list-fiat-currencies
    let supportedFiatCurrencies = try? sdk.listFiatCurrencies()
    // ANCHOR_END: list-fiat-currencies
    return supportedFiatCurrencies
}

func getCurrentRates(sdk: BlockingBreezServices) -> [Rate]? {
    // ANCHOR: fetch-fiat-rates
    let fiatRates = try? sdk.fetchFiatRates()
    // ANCHOR_END: fetch-fiat-rates
    return fiatRates
}
