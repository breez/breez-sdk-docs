# Sending Spontaneous Lightning Payments

They can even be spontaneous payments to a node without a bolt11 invoice.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_spontaneous_payment.rs:send-spontaneous-payment}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift
let nodeId = "...";
do {
    let response = try sdk.sendSpontaneousPayment(
        req: SendSpontaneousPaymentRequest(
            nodeId: "...",
            amountMsat: 3000000))
} catch {
    // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
val nodeId = "..."
val amountMsat = 3000000L.toULong()
try {
    val response = sdk.sendSpontaneousPayment(
        SendSpontaneousPaymentRequest(nodeId, amountMsat))
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_spontaneous_payment.ts:send-spontaneous-payment}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
{{#include ../../snippets/dart_snippets/lib/send_spontaneous_payment.dart:send-spontaneous-payment}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python_snippets/send_spontaneous_payment.py:send-spontaneous-payment}}
```
</section>

<div slot="title">Go</div>
<section>

```go
sendSpontaneousPaymentRequest := breez_sdk.SendSpontaneousPaymentRequest{
    NodeId:     "...",
    AmountMsat: uint64(3000000),
}
if response, err := sdk.SendSpontaneousPayment(sendSpontaneousPaymentRequest); err == nil {
    log.Printf("%#v", response)
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
{{#include ../../snippets/csharp/SendSpontaneousPayment.cs:send-spontaneous-payment}}
```
</section>
</custom-tabs>
