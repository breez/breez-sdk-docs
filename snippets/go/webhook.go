package example

import (
	"log"
)

func RegisterWebhook() {
	// ANCHOR: register-webook
	url := "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
	if err := sdk.RegisterWebhook(url); err != nil {
		log.Printf("Webhook register failed: %v", err)
	}
	// ANCHOR_END: register-webook
}

func UnregisterWebhook() {
	// ANCHOR: unregister-webook
	url := "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
	if err := sdk.UnregisterWebhook(url); err != nil {
		log.Printf("Webhook unregister failed: %v", err)
	}
	// ANCHOR_END: unregister-webook
}
