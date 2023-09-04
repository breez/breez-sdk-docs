# Sending and receiving Lightning payments

## Receiving Lightning Payments

Breez SDK doesn't require you to open a channel and set up your inbound liquidity.
Breez SDK automatically connects your node to the LSP peer and you can now receive payments:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let invoice = sdk.receive_payment(3000, "Invoice for 3000 sats".into()).await?;
```
</section>

<div slot="title">Swift</div>
<section>

```swift
do {
  let invoice = try sdk.receivePayment(
    reqData: ReceivePaymentRequest(
        amountSats: 3000, 
        description: "Invoice for 3000 sats"))
} catch {
    // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
try {
    val invoice = sdk.receivePayment(3000L.toULong(), "Invoice for 3000 sats")
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
try {
    const invoice = await receivePayment({
        amountSats: 3000, 
        description: "Invoice for 3000 sats"
    })
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    ReceivePaymentRequestData requestData = ReceivePaymentRequestData(amountSats: 3000, description: "Invoice for 3000 sats");
    ReceivePaymentResponse invoice = await receivePayment(reqData: requestData);
} catch (error) {
    // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
try:
  receive_payment_response = sdk_services.receive_payment(
    breez_sdk.ReceivePaymentRequest(
        amount_sats=3000,
        description="Invoice for 3000 sats"))
except Exception as error:
  # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
invoice, err := sdkService.ReceivePayment(breez_sdk.ReceivePaymentRequest{
	AmountSats:  3000,
	Description: "Invoice for 3000 sats",
})
```
</section>

<div slot="title">C#</div>
<section>

```cs
try 
{
    var invoice = sdk.ReceivePayment(3000, "Invoice for 3000 sats");
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>

## Sending Lightning Payments

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let bolt11 = "...";
sdk.send_payment(bolt11.into(), Some(3000)).await?;
```
</section>

<div slot="title">Swift</div>
<section>

```swift
let bolt11 = "...";
do {
  // The `amountSats` param is optional so nil can be passed if the 
  // bolt11 invoice spesifies an amount.
  let payment = try sdk.sendPayment(bolt11:  bolt11, amountSats: 3000)
} catch {
    // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
val bolt11 = "..."
try {
    val payment = sdk.sendPayment(bolt11, 3000L.toULong())
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
const bolt11 = "...";
try {
    const payment = await sendPayment(bolt11, 3000)
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
String bolt11 = "...";
try {
    Payment payment = await sendPayment(
      bolt11: bolt11,
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
bolt11 = "..."
try:
  # The `amountSats` param is optional so None can be passed if the 
  # bolt11 invoice spesifies an amount.
  sdk_services.send_payment(bolt11=bolt11, amount_sats=None)
except Exception as error:
  # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
const bolt11 = "...";
payment, err := sdkServices.SendPayment(bolt11, 3000)
```
</section>

<div slot="title">C#</div>
<section>

```cs
const bolt11 = "...";
try 
{
    var payment = sdk.SendPayment(bolt11, 3000);
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>

## Sending Spontaneous Lightning Payments

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let node_id = "...";
sdk.send_spontaneous_payment(node_id.into(), 3000).await?;
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

```kotlin
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
const nodeId = "...";
try {
    const payment = await sendSpontaneousPayment(nodeId, 3000)
} catch (error) {
    console.log(error)
}
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
const nodeId = "...";
payment, err := sdkServices.SendSpontaneousPayment(nodeId, 3000)
```
</section>

<div slot="title">C#</div>
<section>

```cs
const nodeId = "...";
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