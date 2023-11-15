//
//  FiatCurrencies.swift
//
//
//  Created by ruben on 14/11/2023.
//

import Foundation
import BreezSDK

func listSupportedFiatCurrencies(sdk: BlockingBreezServices) -> [FiatCurrency]? {
    // ANCHOR: list-fiat-currencies
    let supportedFiatCurrencies = try? sdk.listFiatCurrencies()
    // ANCHOR_END: list-fiat-currencies
    return supportedFiatCurrencies
}

func getCurrentRates(sdk:BlockingBreezServices) -> [Rate]? {
    // ANCHOR: fetch-fiat-rates
    let fiatRates = try? sdk.fetchFiatRates()
    // ANCHOR_END: fetch-fiat-rates
    return fiatRates
}

func getFiatCurrencyAndRates(sdk: BlockingBreezServices) -> [(FiatCurrency,Rate)]? {
    // ANCHOR: get-fiat-currencies-and-rates
    var ratesMap = [String:Rate]()
    if let supportedFiatCurrencies = try? sdk.listFiatCurrencies(), let fiatRates = try? sdk.fetchFiatRates() {
        for fiatRate in fiatRates {
            ratesMap[fiatRate.coin.lowercased()] = fiatRate
        }
        
        let sorted = supportedFiatCurrencies.sorted(by: { f1, f2 in
            f1.id<f2.id
        })
        
        var result = [(FiatCurrency,Rate)]()
        for currency in sorted {
            if let rate = ratesMap[currency.id.lowercased()] {
                result.append((currency, rate))
            }
            
        }
        return result
    }
    // ANCHOR_END: get-fiat-currencies-and-rates
    return nil
}
