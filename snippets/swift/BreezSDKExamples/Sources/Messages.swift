import BreezSDK

func signMessage(sdk: BlockingBreezServices) -> SignMessageResponse? {
    // ANCHOR: sign-message
    let signMessageRequest = SignMessageRequest(
        message: "<message to sign>"
    )
    let signMessageResponse = try? sdk
        .signMessage(req: signMessageRequest)

    // Get the node info for your pubkey
    let info = try? sdk.nodeInfo()

    let signature = signMessageResponse!.signature
    let pubkey = info!.id

    print("Pubkey: {}", pubkey);
    print("Signature: {}", signature);
    // ANCHOR_END: sign-message
    return signMessageResponse
}

func checkMessage(sdk: BlockingBreezServices) -> CheckMessageResponse? {
    // ANCHOR: check-message
    let checkMessageRequest = CheckMessageRequest(
        message: "<message>",
        pubkey: "<pubkey of signer>",
        signature: "<message signature>"
    )
    let checkMessageResponse = try? sdk
        .checkMessage(req: checkMessageRequest)

    let isValid = checkMessageResponse!.isValid

    print("Signature valid: {}", isValid);
    // ANCHOR_END: check-message
    return checkMessageResponse
}
