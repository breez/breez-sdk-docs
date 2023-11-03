using Breez.Sdk;

public class FiatCurrenciesSnippets
{
  public void ListFiatCurrencies(BlockingBreezServices sdk)
  {
    // ANCHOR: list-fiat-currencies
    try
    {
      var fiatCurrencies = sdk.ListFiatCurrencies();
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: list-fiat-currencies
  }

  public void FetchFiatRates(BlockingBreezServices sdk)
  {
    // ANCHOR: fetch-fiat-rates
    try
    {
      var fiatRates = sdk.FetchFiatRates();
    }
    catch (Exception)
    {
      // Handle error
    }
    // ANCHOR_END: fetch-fiat-rates
  }

  public void GetFiatCurrenciesAndRates(BlockingBreezServices sdk)
  {
    // ANCHOR: get-fiat-currencies-and-rates
    // TODO
    // ANCHOR_END: get-fiat-currencies-and-rates
  }
}
