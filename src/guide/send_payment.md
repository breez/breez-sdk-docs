# Sending Lightning Payments

Once you have outbound liquidity you can start sending payments too.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
// The `amount_msat` param is optional and should only passed if the bolt11 doesn't specify an amount.
// The amount_msat is required in case an amount is not specified in the bolt11 invoice'.
let amount_msat: Option<u64> = None;
let req = SendPaymentRequest {
    bolt11: "...".into(),
    amount_msat,
};
let response = self.send_payment(req).await?;
```
</section>

<div slot="title">Swift</div>
<section>

```swift
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

<div slot="title">Android</div>
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
const bolt11 = "..."
try {
    // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
    // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
    const amountMsat = 3000000
    const response = await sendPayment({bolt11, amountMsat})
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
    // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
    // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
    SendPaymentRequest req = SendPaymentRequest(
      bolt11: bolt11,
      amountMsat: 3000000,
    );
    SendPaymentResponse payment = await sendPayment(req: req);
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

```go
bolt11 := "bolt11 invoice"
// The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
// The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
amountMsat := uint64(3000000)
sendPaymentRequest := breez_sdk.SendPaymentRequest{
    Bolt11: bolt11,
    AmountMsat: amountMsat,
}
if response, err := sdk.SendPayment(sendPaymentRequest); err == nil {
    log.Printf("%#v", response)
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
var bolt11 = "...";
var amountMsat = 3000000;
try 
{
    // The `amountMsat` param is optional and should only passed if the bolt11 doesn't specify an amount.
    // The amountMsat is required in case an amount is not specified in the bolt11 invoice'.
    var response = sdk.SendPayment(new SendPaymentRequest(bolt11, amountMsat));
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>
