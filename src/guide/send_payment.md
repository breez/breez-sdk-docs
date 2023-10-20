# Sending Lightning Payments

Once you have outbound liquidity you can start sending payments too.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_payment.rs:7:8}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift
let bolt11 = "...";
do {
  // The `amountSats` param is optional so nil can be passed if the 
  // bolt11 invoice spesifies an amount.
  let payment = try sdk.sendPayment(bolt11: bolt11, amountSats: 3000)
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
bolt11 := "bolt11 invoice"
amountSats := uint64(3000)
if payment, err := sdk.SendPayment(bolt11, &amountSats); err == nil {
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
