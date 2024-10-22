using Breez.Sdk;

public class ServiceStatusSnippets
{
    public void RegisterWebhook(BlockingBreezServices sdk)
    {
        // ANCHOR: register-webook
        try
        {
            var url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>";
            sdk.RegisterWebhook(url);
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
            var url = "https://your-nds-service.com/notify?platform=<ios|android>&token=<PUSH_TOKEN>";
            sdk.UnregisterWebhook(url);
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: unregister-webook
    }
}
