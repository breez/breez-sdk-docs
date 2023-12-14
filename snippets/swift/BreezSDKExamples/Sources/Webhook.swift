//
//  ServiceStatus.swift
//  
//
//

import Foundation
import BreezSDK

func webhook(sdk: BlockingBreezServices) throws {
    // ANCHOR: register-webook
    sdk.registerWebhook("https://yourapplication.com")    
    // ANCHOR_END: register-webook   
}

func paymentWebhook(sdk: BlockingBreezServices) {
    // ANCHOR: register-payment-webook
    sdk.registerWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>").await?    
    // ANCHOR_END: register-payment-webook
}
