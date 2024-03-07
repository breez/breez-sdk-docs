import BreezSDK

func getFeeInfoAfterInvoiceCreated(receivePaymentResponse: ReceivePaymentResponse) -> ReceivePaymentResponse? {
    // ANCHOR: get-fee-info-after-invoice-created
    let openingFeeSat = (receivePaymentResponse.openingFeeMsat ?? 0) / 1000;
    print("A setup fee of \(openingFeeSat) sats is applied to this invoice.")
    // ANCHOR_END: get-fee-info-after-invoice-created

    return receivePaymentResponse
}
