# Sending and receiving Lightning payments

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

## Receiving Lightning Payments
Breez SDK doesn't require you to open a channel and set up your inbound liquidity.
Breez SDK automatically connects your node to the LSP peer and you can now receive payments:

```rust,no_run
let invoice = sdk.receive_payment(3000, "Invoice for 3000 sats".into()).await?;
```

## Sending Lightning Payments
```rust,no_run
let bolt11 = "...";
sdk.send_payment(bolt11.into(), Some(3000)).await?;
```

## Sending Spontaneous Lightning Payments
```rust,no_run
let node_id = "...";
sdk.send_payment(node_id.into(), Some(3000)).await?;
```

</section>
<div slot="title">Swift</div>
<section>

## Receiving Lightning Payments
Breez SDK doesn't require you to open a channel and set up your inbound liquidity.
Breez SDK automatically connects your node to the LSP peer and you can now receive payments:

```swift
do {
  let invoice = try sdk.receivePayment(amountSats: 3000, description: "Invoice for 3000 sats")
} catch {
    // handle error
}
```

## Sending Lightning Payments
```swift
let bolt11 = "...";
do {
  let payment = try sdk.sendPayment(bolt11: bolt11, amountSats: 3000)
} catch {
    // handle error
}
```

## Sending Spontaneous Lightning Payments
```swift
let nodeId = "...";
do {
  let payment = try sdk.sendSpontaneousPayment(nodeId: nodeId, amountSats: 3000)
} catch {
    // handle error
}
```
</section>
<div slot="title">React Native</div>
<section>

## Receiving Lightning Payments
Breez SDK doesn't require you to open a channel and set up your inbound liquidity.
Breez SDK automatically connects your node to the LSP peer and you can now receive payments:

```typescript
try {
    const invoice = await receivePayment(3000, "Invoice for 3000 sats")
} catch (error) {
    console.log(error)
}
```

## Sending Lightning Payments
```typescript
const bolt11 = "...";
try {
    const payment = await sendPayment(bolt11, 3000)
} catch (error) {
    console.log(error)
}
```

## Sending Spontaneous Lightning Payments
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

## Receiving Lightning Payments
Breez SDK doesn't require you to open a channel and set up your inbound liquidity.
Breez SDK automatically connects your node to the LSP peer and you can now receive payments:

```dart
try {
    ReceivePaymentRequestData requestData = ReceivePaymentRequestData(amountSats: 3000, description: "Invoice for 3000 sats");
    ReceivePaymentResponse invoice = await receivePayment(reqData: requestData);
} catch (error) {
    // handle error
}
```

## Sending Lightning Payments
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

## Sending Spontaneous Lightning Payments
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

## Receiving Lightning Payments
Breez SDK doesn't require you to open a channel and set up your inbound liquidity.
Breez SDK automatically connects your node to the LSP peer and you can now receive payments:

```python
try:
  invoice = sdk_services.receive_payment(3000, "Invoice for 3000 sats")
except Exception as error:
  # Handle error
```

## Sending Lightning Payments
```python
bolt11 = "..."
try:
  sdk_services.send_payment(bolt11, 3000)
except Exception as error:
  # Handle error
```

## Sending Spontaneous Lightning Payments
```python
let node_id = "..."
try:
  sdk_services.send_spontaneous_payment(node_id, 3000)
except Exception as error:
  # Handle error
```

</section>
<div slot="title">Go</div>
<section>

## Receiving Lightning Payments
Breez SDK doesn't require you to open a channel and set up your inbound liquidity.
Breez SDK automatically connects your node to the LSP peer and you can now receive payments:

```go
invoice, err := sdkServices.ReceivePayment(3000, "Invoice for 3000 sats")
```

## Sending Lightning Payments
```go
const bolt11 = "...";
payment, err := sdkServices.SendPayment(bolt11, 3000)
```

## Sending Spontaneous Lightning Payments
```go
const nodeId = "...";
payment, err := sdkServices.SendSpontaneousPayment(nodeId, 3000)
```

</section>
<div slot="title">C#</div>
<section>

## Receiving Lightning Payments
Breez SDK doesn't require you to open a channel and set up your inbound liquidity.
Breez SDK automatically connects your node to the LSP peer and you can now receive payments:

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

## Sending Lightning Payments
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

## Sending Spontaneous Lightning Payments
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