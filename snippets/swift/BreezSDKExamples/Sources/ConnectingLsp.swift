//
//  ConnectingLsp.swift
//  
//
//  Created by ruben on 14/11/2023.
//

import Foundation
import BreezSDK

func getLspInfo(sdk: BlockingBreezServices) -> LspInformation?{
    // ANCHOR: get-lsp-info
    let lspId = try? sdk.lspId()
    let lspInfo = try? sdk.lspInfo()
    // ANCHOR_END: get-lsp-info
    return lspInfo
}

func listLsps(sdk: BlockingBreezServices) {
    // ANCHOR: list-lsps
    let availableLsps = try? sdk.listLsps()
    // ANCHOR_END: list-lsps
}

func connectLsp(sdk: BlockingBreezServices, lspId: String) {
    // ANCHOR: connect-lsp
    try? sdk.connectLsp(lspId: lspId)
    // ANCHOR_END: connect-lsp
}
