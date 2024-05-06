using Breez.Sdk;

public class WebhooksSnippets
{
    public void HealthCheckStatus(BlockingBreezServices sdk)
    {
        // ANCHOR: health-check-status
        try
        {
            var healthCheck = BreezSdkMethods.ServiceHealthCheck("<api key>");
            Console.WriteLine($"Current service status is: {healthCheck.status}");
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: health-check-status
    }

    public void ReportPaymentFailure(BlockingBreezServices sdk)
    {
        // ANCHOR: report-payment-failure
        var paymentHash = "...";
        try
        {
            sdk.ReportIssue(new ReportIssueRequest.PaymentFailure(
                new ReportPaymentFailureDetails(paymentHash)
            ));
        }
        catch (Exception)
        {
            // Handle error
        }
        // ANCHOR_END: report-payment-failure
    }
}
