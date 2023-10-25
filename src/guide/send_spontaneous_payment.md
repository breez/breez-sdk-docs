# Sending Spontaneous Lightning Payments

They can even be spontaneous payments to a node without a bolt11 invoice.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
sdk.send_spontaneous_payment(
    SendSpontaneousPaymentRequest {
        node_id: "...".into(), 
        amount_msat: 3000000,
    })
    .await?;
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

<div slot="title">Android</div>
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
const nodeId = "..."
const amountMsat = 3000000
try {
    const response = await sendSpontaneousPayment({nodeId, amountMsat})
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    SendPaymentResponse response = await sendSpontaneousPayment(
        req: SendSpontaneousPaymentRequest(
            nodeId: "...",
            amountMsat: 3000000,
        ),
    );
} catch (error) {
    // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
try:
    sdk_services.send_spontaneous_payment(
        breez_sdk.SendSpontaneousPaymentRequest(
            node_id="...", 
            amount_msat=3000000))
except Exception as error:
  # Handle error
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
var nodeId = "...";
var amountMsat = 3000000;
try 
{
    var response = sdk.SendSpontaneousPayment(new SendSpontaneousPaymentRequest(nodeId, amountMsat));
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>
