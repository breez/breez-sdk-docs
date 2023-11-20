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
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendPayment.swift:send-payment}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendPayment.kt:send-payment}}
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
