# Buy Bitcoin

This section of the Breez SDK documentation provides an example on purchasing Bitcoin using Moonpay as the provider. The example code snippet demonstrates how to initiate a Bitcoin purchase transaction using the Breez SDK.

The SDK will generate a Bitcoin address and prepare a URL using the specified provider. The user needs to open the URL and proceed with the provider flow to buy the Bitcoin.

Once the buy is completed, the provider will transfer the Bitcoin to the generated address and Breez SDK will add the received Bitcoin to the Lightning balance.

<custom-tabs category="lang">

<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/buy_btc.rs:buy-btc}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
do {
  let buyBitcoinResponse = try sdk.buyBitcoin(
    req: BuyBitcoinRequest(provider: .moonpay))
} catch {
  // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
try {
    // Choose your provider
    val provider = BuyBitcoinProvider.MOONPAY
    // request the url to proceed with the Bitcoin acquisition
    val url = sdk.buyBitcoin(BuyBitcoinRequest(provider)).url
    // Opens the url in the browser to buy on provider's site
    startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
} catch (e: Exception) {
    // Handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/buy_btc.ts:buy-btc}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/buy_btc.dart:buy-btc}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
try:
    buy_bitcoin_resp = sdk_services.buy_bitcoin(
        breez_sdk.BuyBitcoinRequest(
            breez_sdk.BuyBitcoinProvider.MOONPAY))
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/buy_btc.go:buy-btc}}
```
</section>

<div slot="title">C#</div>

<section>

```cs,ignore
{{#include ../../snippets/csharp/BuyBtc.cs:buy-btc}}
```
</section>
</custom-tabs>