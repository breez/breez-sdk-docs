# Supporting fiat currencies

<custom-tabs category="lang">
<div slot="title">Dart</div>
<section>


In order to list the availiable fiat currencies.
```dart
try {
    List<FiatCurrency> fiatCurrencyList = await listFiatCurrencies();
} catch(e) {
     // Handle error
}
```

To get the current BTC rate for the currencies.

```dart
try {
    Map<String, Rate> fiatRatesMap =  fetchFiatRates();
    // print your desired rate 
    print(fiatRatesMap["USD"]?.value);
} catch(e) {
     // Handle error
}
```
</section>
<div slot="title">python</div>
<section>


In order to list the availiable fiat currencies.
```python
try: 
    fiat_currencies = sdk_services.list_fiat_currencies()

except Exception as error:
    #Handle error
```

To get the current BTC rate for the currencies.

```python
try:
    fiat_rates = sdk_services.sdk_services.fetch_fiat_rates()
    # print your desired rate 
except Exception as error:
    # Handle error

```

</section>
</custom-tabs>