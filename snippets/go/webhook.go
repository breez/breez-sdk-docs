package example

import (
	"log"
)

func RegisterWebhook() error {
	// ANCHOR: register-webook
	url := "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
	err := sdk.RegisterWebhook(url)
	if err != nil {
		log.Printf("Webhook register failed: %v", err)
		return err
	}
	// ANCHOR_END: register-webook
	return nil
}

func UnregisterWebhook() error {
	// ANCHOR: unregister-webook
	url := "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>"
	err := sdk.UnregisterWebhook(url)
	if err != nil {
		log.Printf("Webhook unregister failed: %v", err)
		return err
	}
	// ANCHOR_END: unregister-webook
	return nil
}
