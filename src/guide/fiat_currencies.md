# Supporting fiat currencies

<custom-tabs category="lang">
<div slot="title">React Native</div>
<section>
In order to list the availiable fiat currencies.

```typescript
try {
    const fiatCurrencyList = await listFiatCurrencies()
} catch (error) {
    console.log(error)
}
```

To get the current BTC rate for the currencies.

```typescript
try {
    const fiatRatesMap = fetchFiatRates()
} catch (error) {
    console.log(error)
}
```
</section>
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
    Map<String, Rate> fiatRatesMap = fetchFiatRates();
    // print your desired rate 
    print(fiatRatesMap["USD"]?.value);
} catch(e) {
     // Handle error
}
```
</section>
<div slot="title">Python</div>
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
    fiat_rates = sdk_services.fetch_fiat_rates()
    # print your desired rate 
except Exception as error:
    # Handle error
```
</section>
<div slot="title">Go</div>
<section>
In order to list the availiable fiat currencies.

```go
fiatCurrencies, err := sdkServices.ListFiatCurrencies()
```

To get the current BTC rate for the currencies.

```go
fiatRates, err := sdkServices.FetchFiatRates()
```
</section>
</custom-tabs>