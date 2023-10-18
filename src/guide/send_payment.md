# Sending Lightning Payments

Once you have outbound liquidity you can start sending payments too.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let bolt11 = "...";
sdk.send_payment(bolt11.into(), None).await?;
```
</section>

<div slot="title">Swift</div>
<section>

```swift
let bolt11 = "...";
do {
  // The `amount_msat` param is optional and should only passed if the bolt11 doesn't specify an amount.
  // The amount_msat is required in case an amount is not specified in the bolt11 invoice'.
  let payment = try sdk.sendPayment(bolt11: bolt11, amount_msat: 3000)
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
    val payment = sdk.sendPayment(bolt11, 3000L.toULong())
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
      amount_msat: 3000,
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
  # The `amount_msat` param is optional and should only passed if the bolt11 doesn't specify an amount.
  # The amount_msat is required in case an amount is not specified in the bolt11 invoice'.
  sdk_services.send_payment(bolt11=bolt11, amount_msat=None)
except Exception as error:
  # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
bolt11 := "bolt11 invoice"
amount_msat := uint64(3000)
if payment, err := sdk.SendPayment(bolt11, &amount_msat); err == nil {
    log.Printf("%#v", payment)
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
var bolt11 = "...";
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
