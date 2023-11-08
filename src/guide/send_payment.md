# Sending Lightning Payments

Once you have outbound liquidity you can start sending payments too.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_payment.rs:send-payment}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
do {
  // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
  // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
  let req = SendPaymentRequest(bolt11: "...", amountMsat: 3000000)
  let response = try sdk.sendPayment(req: req)
} catch {
    // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
val bolt11 = "..."
try {
    // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
    // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
    val amountMsat = 3000000L.toULong()
    val req = SendPaymentRequest(bolt11, amountMsat)
    val response = sdk.sendPayment(req)
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_payment.ts:send-payment}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_payment.dart:send-payment}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
bolt11 = "..."
try:
  # The `amount_msat` param is optional and should only passed if the bolt11 doesn't specify an amount.
  # The amount_msat is required in case an amount is not specified in the bolt11 invoice'.
  req = breez_sdk.SendPaymentRequest(bolt11=bolt11, amount_msat=3000000)
  sdk_services.send_payment(req=req)
except Exception as error:
  # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_payment.go:send-payment}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendPayment.cs:send-payment}}
```
</section>
</custom-tabs>
