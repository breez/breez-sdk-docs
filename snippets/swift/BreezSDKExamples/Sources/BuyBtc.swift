//
//  BuyBtc.swift
//
//
//  Created by ruben on 14/11/2023.
//

import BreezSDK
import Foundation

func buy(sdk: BlockingBreezServices) -> BuyBitcoinResponse? {
    // ANCHOR: buy-btc
    let buyBitcoinResponse = try? sdk.buyBitcoin(
        req: BuyBitcoinRequest(provider: .moonpay))
    // ANCHOR_END: buy-btc
    return buyBitcoinResponse
}
