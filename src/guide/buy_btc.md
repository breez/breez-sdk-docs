# Buying Bitcoin

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
{{#include ../../snippets/swift/BreezSDKExamples/Sources/BuyBtc.swift:buy-btc}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/BuyBtc.kt:buy-btc}}
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
{{#include ../../snippets/python/src/buy_btc.py:buy-btc}}
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
