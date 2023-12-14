//
//  ServiceStatus.swift
//  
//
//

import Foundation
import BreezSDK

func webhook(sdk: BlockingBreezServices) throws {
    // ANCHOR: register-webook
    sdk.registerWebhook(webhookUrl: "https://yourapplication.com")    
    // ANCHOR_END: register-webook   
}

func paymentWebhook(sdk: BlockingBreezServices) {
    // ANCHOR: register-payment-webook
    sdk.registerWebhook(webhookUrl: "https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")  
    // ANCHOR_END: register-payment-webook
}
