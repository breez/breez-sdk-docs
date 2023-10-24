import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<List<FiatCurrency>> listFiatCurrencies() async {
  // ANCHOR: list-fiat-currencies
  List<FiatCurrency> fiatCurrencyList = await BreezSDK().listFiatCurrencies();
  // ANCHOR_END: list-fiat-currencies
  return fiatCurrencyList;
}

Future<Map<String, Rate>> fetchFiatRates(String lspId) async {
  // ANCHOR: fetch-fiat-rates
  Map<String, Rate> fiatRatesMap = await BreezSDK().fetchFiatRates();
  // print your desired rate
  print(fiatRatesMap["USD"]?.value);
  // ANCHOR_END: fetch-fiat-rates
  return fiatRatesMap;
}

Future<Map<FiatCurrency, Rate>> fiatCurrenciesAndRate() async {
  // ANCHOR: get-fiat-currencies-and-rates
  List<FiatCurrency> fiatCurrencies = await BreezSDK().listFiatCurrencies();
  Map<String, Rate> fiatRates = await BreezSDK().fetchFiatRates();

  var sorted = fiatCurrencies.toList();
  sorted.sort((f1, f2) {
    return f1.id.compareTo(f2.id);
  });

  Map<FiatCurrency, Rate> result = {};
  for (var currency in sorted) {
    var rate = fiatRates[currency.id];
    if (rate != null) {
      result[currency] = rate;
    }
  }

  return result;
  // ANCHOR_END: get-fiat-currencies-and-rates
}
