using Breez.Sdk;

public class ServiceStatusSnippets
{
    public void RegisterWebhook(BlockingBreezServices sdk)
    {
        // ANCHOR: register-webook
        try
        {
            sdk.RegisterWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: register-webook
    }
        
    public void UnregisterWebhook(BlockingBreezServices sdk)
    {
        // ANCHOR: unregister-webook
        try
        {
            sdk.UnregisterWebhook("https://your-nds-service.com/notify?platform=ios&token=<PUSH_TOKEN>");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: unregister-webook
    }
}
