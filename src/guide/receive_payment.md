# Receiving Lightning Payments

With the Breez SDK you aren't required to open a channel and set up your inbound liquidity.
The Breez SDK automatically connects your node to the LSP peer and you can now receive payments.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/receive_payment.rs:receive-payment}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift
do {
  let invoice = try sdk.receivePayment(
    req: ReceivePaymentRequest(
        amountMsat: 3_000_000, 
        description: "Invoice for 3000 sats"))
} catch {
    // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
try {
    val invoice = sdk.receivePayment(ReceivePaymentRequest(
        3_000_000L.toULong(),
        "Invoice for 3000 sats",
    ))
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/receive_payment.ts:receive-payment}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
{{#include ../../snippets/dart_snippets/lib/receive_payment.dart:receive-payment}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python_snippets/src/receive_payment.py:receive-payment}}
```
</section>

<div slot="title">Go</div>
<section>

```go
receivePaymentRequest := breez_sdk.ReceivePaymentRequest{
    AmountMsat:  3_000_000,
    Description: "Invoice for 3000 sats",
}
if receivePaymentResponse, err := sdk.ReceivePayment(receivePaymentRequest); err == nil {
    log.Printf("%#v", receivePaymentResponse)
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
{{#include ../../snippets/csharp/ReceivePayment.cs:receive-payment}}
```
</section>
</custom-tabs>
