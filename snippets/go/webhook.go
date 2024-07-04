package example

import (
	"log"
)

func RegisterWebhook() {
	// ANCHOR: register-webook
	if err := sdk.RegisterWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>"); err != nil {
		log.Printf("Webhook register failed: %v", err)
	}
	// ANCHOR_END: register-webook
}

func UnregisterWebhook() {
	// ANCHOR: unregister-webook
	if err := sdk.UnregisterWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>"); err != nil {
		log.Printf("Webhook unregister failed: %v", err)
	}
	// ANCHOR_END: unregister-webook
}
