using Breez.Sdk;

public class ServiceStatusSnippets
{
    public void Webhook(BlockingBreezServices sdk)
    {
        // ANCHOR: register-webook
        try
        {
            sdk.RegisterWebhook("https://yourapplication.com");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: register-webook
    }

    public void PaymentWebhook(BlockingBreezServices sdk)
    {
        // ANCHOR: register-payment-webook
        try
        {
            sdk.RegisterWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: register-payment-webook
    }
}
