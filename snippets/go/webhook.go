package example

import (
	"log"
)

func Webhook() {
	// ANCHOR: register-webook
	if err := sdk.RegisterWebhook("https://yourapplication.com"); err != nil {
		log.Printf("Webhook registration failed: %v", err)
	}
	// ANCHOR_END: register-webook
}

func PaymentWebhook() {
	// ANCHOR: register-payment-webook
	if err := sdk.RegisterWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>"); err != nil {
		log.Printf("Webhook registration failed: %v", err)
	}
	// ANCHOR_END: register-payment-webook
}
