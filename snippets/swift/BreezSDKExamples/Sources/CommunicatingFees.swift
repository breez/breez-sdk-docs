import BreezSDK

func getFeeInfoBeforeInvoiceCreated(sdk: BlockingBreezServices) {
    // ANCHOR: get-fee-info-before-receiving-payment
    if let nodeInfo = try? sdk.nodeInfo() {
        let inboundLiquiditySat = nodeInfo.maxReceivableSinglePaymentAmountMsat / 1_000;

        let openingFeeResponse = try? sdk.openChannelFee(req: OpenChannelFeeRequest(amountMsat: nil));

        if let openingFees = openingFeeResponse?.feeParams {
            let feePercentage = Double(openingFees.proportional * 100) / 1_000_000.0;
            let minFeeSat = openingFees.minMsat / 1_000;

            if inboundLiquiditySat == 0 {
                print("A setup fee of \(feePercentage)% with a minimum of \(minFeeSat) sats will be applied.");
            } else {
                print("A setup fee of \(feePercentage)% with a minimum of \(minFeeSat) sats will be applied for receiving more than \(inboundLiquiditySat) sats.");
            }
        }
    }
    // ANCHOR_END: get-fee-info-before-receiving-payment
}

func getFeeInfoAfterInvoiceCreated(receivePaymentResponse: ReceivePaymentResponse) -> ReceivePaymentResponse? {
    // ANCHOR: get-fee-info-after-invoice-created
    let openingFeeSat = (receivePaymentResponse.openingFeeMsat ?? 0) / 1_000;
    print("A setup fee of \(openingFeeSat) sats is applied to this invoice.")
    // ANCHOR_END: get-fee-info-after-invoice-created

    return receivePaymentResponse
}


func getFeeInfoReceiveOnchain(sdk: BlockingBreezServices) {
    // ANCHOR: get-fee-info-receive-onchain
    let swapInfo = try? sdk.receiveOnchain(req: ReceiveOnchainRequest())

    let minDepositSat = swapInfo!.minAllowedDeposit;
    let maxDepositSat = swapInfo!.maxAllowedDeposit;

    let nodeInfo = try? sdk.nodeInfo();
    let inboundLiquiditySat = nodeInfo!.maxReceivableSinglePaymentAmountMsat / 1_000;

    if let swapOpeningFees = swapInfo!.channelOpeningFees {
        let feePercentage = Double(swapOpeningFees.proportional * 100) / 1_000_000.0;
        let minFeeSat = swapOpeningFees.minMsat / 1_000;

        print("Send more than \(minDepositSat) sats and up to \(maxDepositSat) sats to this address. A setup fee of \(feePercentage)% with a minimum of \(minFeeSat) sats will be applied for sending more than \(inboundLiquiditySat) sats. This address can only be used once.");
    }
    // ANCHOR_END: get-fee-info-receive-onchain
}
