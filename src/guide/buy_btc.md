# Buy Bitcoin

This section of the Breez SDK documentation provides an example on purchasing Bitcoin using Moonpay as the provider. The example code snippet demonstrates how to initiate a Bitcoin purchase transaction using the Breez SDK.

<custom-tabs category="lang">

<div slot="title">Rust</div>
<section>

```rust
// TODO add docs
```

</section>

<div slot="title">Swift</div>
<section>

```swift
do {
  let buyBitcoinResponse = try sdk.buyBitcoin(
    req: BuyBitcoinRequest(provider: .moonpay))
} catch {
  // handle error
}
    
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
// TODO add docs
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
try {
    let buyBitcoinResponse = await buyBitcoin({provider: BuyBitcoinProvider.MOONPAY})
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    BuyBitcoinResponse buyBitcoinResponse = buyBitcoin(
        reqData: BuyBitcoinRequest(provider: BuyBitcoinProvider.Moonpay,
        ),
    ); 
} catch {
    // Handle error
}

```
</section>

<div slot="title">Python</div>
<section>

```python
try:
    buy_bitcoin_resp = sdk_services.buy_bitcoin(
        breez_sdk.BuyBitcoinRequest(
            breez_sdk.BuyBitcoinProvider.MOONPAY))
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
buyBitcoinResponse, err := sdkService.BuyBitcoin(breez_sdk.BuyBitcoinRequest{
		Provider: breez_sdk.BuyBitcoinProviderMoonpay,
})
```
</section>

<div slot="title">C#</div>

<section>

```cs
// TODO add docs
```
</section>