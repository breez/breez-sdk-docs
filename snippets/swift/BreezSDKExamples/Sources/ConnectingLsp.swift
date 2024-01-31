//
//  ConnectingLsp.swift
//
//
//  Created by ruben on 14/11/2023.
//

import BreezSDK
import Foundation

func getLspInfo(sdk: BlockingBreezServices) -> LspInformation? {
    // ANCHOR: get-lsp-info
    let lspId = try? sdk.lspId()
    let lspInfo = try? sdk.lspInfo()
    // ANCHOR_END: get-lsp-info
    return lspInfo
}

func listLsps(sdk: BlockingBreezServices) -> [LspInformation]? {
    // ANCHOR: list-lsps
    let availableLsps = try? sdk.listLsps()
    // ANCHOR_END: list-lsps
    return availableLsps
}

func connectLsp(sdk: BlockingBreezServices, lspId: String) {
    // ANCHOR: connect-lsp
    try? sdk.connectLsp(lspId: lspId)
    // ANCHOR_END: connect-lsp
}
