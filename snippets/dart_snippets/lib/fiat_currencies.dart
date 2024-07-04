import 'package:dart_snippets/sdk_instance.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<List<FiatCurrency>> listFiatCurrencies() async {
  // ANCHOR: list-fiat-currencies
  List<FiatCurrency> fiatCurrencyList = await breezSDK.listFiatCurrencies();
  // ANCHOR_END: list-fiat-currencies
  return fiatCurrencyList;
}

Future<Map<String, Rate>> fetchFiatRates(String lspId) async {
  // ANCHOR: fetch-fiat-rates
  Map<String, Rate> fiatRatesMap = await breezSDK.fetchFiatRates();
  // print your desired rate
  print(fiatRatesMap["USD"]?.value);
  // ANCHOR_END: fetch-fiat-rates
  return fiatRatesMap;
}
