# Supporting fiat currencies

In order to list the available fiat currencies:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/fiat_currencies.rs:list-fiat-currencies}}
```
</section>

<div slot="title">Kotlin</div>
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
{{#include ../../snippets/react-native/fiat_currencies.ts:list-fiat-currencies}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/fiat_currencies.dart:list-fiat-currencies}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python_snippets/src/fiat_currencies.py:list-fiat-currencies}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/fiat_currencies.go:list-fiat-currencies}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/FiatCurrencies.cs:list-fiat-currencies}}
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

<div slot="title">Kotlin</div>
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
{{#include ../../snippets/react-native/fiat_currencies.ts:fetch-fiat-rates}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/fiat_currencies.dart:fetch-fiat-rates}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
try:
    fiat_rates = sdk_services.fetch_fiat_rates()
    # print your desired rate 
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/fiat_currencies.go:fetch-fiat-rates}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/FiatCurrencies.cs:fetch-fiat-rates}}
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

<div slot="title">Kotlin</div>
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
{{#include ../../snippets/react-native/fiat_currencies.ts:get-fiat-currencies-and-rates}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/fiat_currencies.dart:get-fiat-currencies-and-rates}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
# TODO
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/fiat_currencies.go:get-fiat-currencies-and-rates}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/FiatCurrencies.cs:get-fiat-currencies-and-rates}}
```
</section>
</custom-tabs>