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
  let payment = try sdk.sendSpontaneousPayment(nodeId: nodeId, amountSats: 3000)
} catch {
    // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
val nodeId = "..."
try {
    val payment = sdk.sendSpontaneousPayment(nodeId, 3000L.toULong())
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
String nodeId = "...";
try {
    Payment payment = await sendSpontaneousPayment(
      nodeId: nodeId,
      amountSats: 3000,
    );
} catch (error) {
    // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
node_id = "..."
try:
  sdk_services.send_spontaneous_payment(node_id=node_id, amount_sats=3000)
except Exception as error:
  # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
nodeId := "node id"
if payment, err := sdk.SendSpontaneousPayment(nodeId, 3000); err == nil {
    log.Printf("%#v", payment)
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
var nodeId = "...";
try 
{
    var payment = sdk.SendSpontaneousPayment(nodeId, 3000);
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>
