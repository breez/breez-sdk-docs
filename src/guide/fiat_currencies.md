# Supporting fiat currencies

In order to list the available fiat currencies:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/fiat_currencies.rs:list-fiat-currencies}}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
try {
    val fiatCurrencyList = sdk.listFiatCurrencies()
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
try {
    const fiatCurrencyList = await listFiatCurrencies()
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
{{#include ../../snippets/dart_snippets/lib/fiat_currencies.dart:list-fiat-currencies}}
```
</section>

<div slot="title">Python</div>
<section>

```python
try: 
    fiat_currencies = sdk_services.list_fiat_currencies()

except Exception as error:
    #Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
if fiatCurrencies, err := sdk.ListFiatCurrencies(); err == nil {
    log.Printf("%#v", fiatCurrencies)
}
```
</section>

<div slot="title">C#</div>
<section>

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
</section>
</custom-tabs>

To get the current BTC rate for the currencies:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/fiat_currencies.rs:fetch-fiat-rates}}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
try {
    val fiatRatesMap = sdk.fetchFiatRates()
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
try {
    const fiatRatesMap = await fetchFiatRates()
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
{{#include ../../snippets/dart_snippets/lib/fiat_currencies.dart:fetch-fiat-rates}}
```
</section>

<div slot="title">Python</div>
<section>

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

```go
if fiatRates, err := sdk.FetchFiatRates(); err == nil {
    log.Printf("%#v", fiatRates)
}
```
</section>

<div slot="title">C#</div>
<section>

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

At the example project you can see these methods combined:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/fiat_currencies.rs:get-fiat-currencies-and-rates}}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
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

```typescript
// TODO
```
</section>

<div slot="title">Dart</div>
<section>

```dart
{{#include ../../snippets/dart_snippets/lib/fiat_currencies.dart:get-fiat-currencies-and-rates}}
```
</section>

<div slot="title">Python</div>
<section>

```python
# TODO
```
</section>

<div slot="title">Go</div>
<section>

```go
// TODO
```
</section>

<div slot="title">C#</div>
<section>

```cs
// TODO
```
</section>
</custom-tabs>