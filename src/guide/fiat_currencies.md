# Supporting fiat currencies

<custom-tabs category="lang">
<div slot="title">Android</div>
<section>
In order to list the available fiat currencies.

```kotlin
try {
    val fiatCurrencyList = sdk.listFiatCurrencies()
} catch (e: Exception) {
    // handle error
}
```

To get the current BTC rate for the currencies.

```kotlin
try {
    val fiatRatesMap = sdk.fetchFiatRates()
} catch (e: Exception) {
    // handle error
}
```

At the example project you can see these methods combined

```kotlin
fun fiatCurrenciesAndRate(): Map<FiatCurrency, Rate> = try {
    val fiatCurrencies = sdk.listFiatCurrencies()
    val fiatRates = sdk.fetchFiatRates()

    val ratesMap = mutableMapOf<String, Rate>()
    for (rate in fiatRates) {
        ratesMap[rate.coin.lowercase()] = rate
    }

    val sorted = fiatCurrencies.sortedBy { it.info.name }
    val result = LinkedHashMap<FiatCurrency, Rate>()
    for (currency in sorted) {
        val rate = ratesMap[currency.id.lowercase()]
        if (rate != null) {
            result[currency] = rate
        }
    }

    result
} catch (e: Throwable) {
    // Handle error
    emptyMap()
}
```
</section>
<div slot="title">React Native</div>
<section>
In order to list the available fiat currencies.

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
In order to list the available fiat currencies.

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
In order to list the available fiat currencies.

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
In order to list the available fiat currencies.

```go
fiatCurrencies, err := sdkServices.ListFiatCurrencies()
```

To get the current BTC rate for the currencies.

```go
fiatRates, err := sdkServices.FetchFiatRates()
```
</section>
<div slot="title">C#</div>
<section>
In order to list the available fiat currencies.

```cs
try 
{
    var fiatCurrencies = sdk.ListFiatCurrencies();
} 
catch (Exception) 
{
    // Handle error
}
```

To get the current BTC rate for the currencies.

```cs
try 
{
    var fiatRates = sdk.FetchFiatRates();
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>