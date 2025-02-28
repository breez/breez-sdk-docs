package example

import (
	"log"

	"github.com/breez/breez-sdk-go/breez_sdk"
)

func SignMessage() {
	// ANCHOR: sign-message
	message := "<message to sign>"

	signMessageRequest := breez_sdk.SignMessageRequest{
		Message: message,
	}
	signMessageResponse, err := sdk.SignMessage(signMessageRequest)
	if err != nil {
		log.Printf("Error: %#v", err)
		return
	}

	// Get the node info for your pubkey
	info, err := sdk.NodeInfo()
	if err != nil {
		log.Printf("Error: %#v", err)
		return
	}

	signature := signMessageResponse.Signature
	pubkey := info.Id

	log.Printf("Pubkey: %v", pubkey)
	log.Printf("Signature: %v", signature)
	// ANCHOR_END: sign-message
}

func CheckMessage() {
	// ANCHOR: check-message
	message := "<message>"
	pubkey := "<pubkey of signer>"
	signature := "<message signature>"

	checkMessageRequest := breez_sdk.CheckMessageRequest{
		Message:   message,
		Pubkey:    pubkey,
		Signature: signature,
	}
	checkMessageResponse, err := sdk.CheckMessage(checkMessageRequest)
	if err != nil {
		log.Printf("Error: %#v", err)
		return
	}

	isValid := checkMessageResponse.IsValid

	log.Printf("Signature valid: %v", isValid)
	// ANCHOR_END: check-message
}
