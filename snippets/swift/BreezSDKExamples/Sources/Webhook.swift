//
//  ServiceStatus.swift
//  
//
//

import Foundation
import BreezSDK

func registerWebhook(sdk: BlockingBreezServices) throws {
    // ANCHOR: register-webook
    try sdk.registerWebhook(webhookUrl: "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")  
    // ANCHOR_END: register-webook
}

func unregisterWebhook(sdk: BlockingBreezServices) throws {
    // ANCHOR: unregister-webook
    try sdk.unregisterWebhook(webhookUrl: "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")  
    // ANCHOR_END: unregister-webook
}
