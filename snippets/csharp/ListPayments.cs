using Breez.Sdk;

public class ListPaymentsSnippets
{
  public void ListPayments(BlockingBreezServices sdk)
  {
    // ANCHOR: list-payments
    try
    {
      var payments = sdk.ListPayments(
          new ListPaymentsRequest(PaymentTypeFilter.ALL));
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: list-payments
  }

  public void ListPaymentsFiltered(BlockingBreezServices sdk)
  {
    // ANCHOR: list-payments-filtered
    try
    {
      var payments = sdk.ListPayments(
          new ListPaymentsRequest(
              PaymentTypeFilter.SENT,
              fromTimestamp: 1696880000,
              includeFailures: true));
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: list-payments-filtered
  }
}
