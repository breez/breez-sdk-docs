package example

import (
	"log"
)

func Webhook() {
	// ANCHOR: register-webook
	_, err := sdk.RegisterWebhook("https://yourapplication.com")
	if err != nil {
		log.Printf("Webhook registration failed: %v", err)
		return err
	}
	// ANCHOR_END: register-webook
}

func PaymentWebhook() {
	// ANCHOR: register-payment-webook
	_, err := sdk.RegisterWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>")
	if err != nil {
		log.Printf("Webhook registration failed: %v", err)
		return err
	}
	// ANCHOR_END: register-payment-webook
}
