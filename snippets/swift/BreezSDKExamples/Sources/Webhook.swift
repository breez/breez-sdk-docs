//
//  ServiceStatus.swift
//  
//
//

import Foundation
import BreezSDK

func registerWebhook(sdk: BlockingBreezServices) throws {
    // ANCHOR: register-webook
    let url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
    try sdk.registerWebhook(webhookUrl: url)  
    // ANCHOR_END: register-webook
}

func unregisterWebhook(sdk: BlockingBreezServices) throws {
    // ANCHOR: unregister-webook
    let url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
    try sdk.unregisterWebhook(webhookUrl: url)  
    // ANCHOR_END: unregister-webook
}
