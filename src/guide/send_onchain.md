# Sending an on-chain transaction (swap-out)

You can send funds from the Breez SDK wallet to an on-chain address as follows.

First, fetch the current reverse swap fees:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_onchain.rs:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
let sendAmountSat:UInt64? = 50000
try {
  let currentFees = try sdk.fetchReverseSwapFees(
      req: ReverseSwapFeesRequest(sendAmountSat: sendAmountSat))
  print("Total estimated fees for reverse swap: \(currentFees.totalEstimatedFees)")
} catch {
    // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
try {
    val fees = sdk.fetchReverseSwapFees(ReverseSwapFeesRequest(50000))
    Log.v("Breez", "Total estimated fees for reverse swap: ${fees.totalEstimatedFees}")
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_onchain.ts:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
try: 
    current_fees = sdk_services.fetch_reverse_swap_fees(
        breez_sdk.ReverseSwapFeesRequest(send_amount_sat=50000))
    print("Total estimated fees for reverseswap: ", current_fees.total_estimated_fees)
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_onchain.go:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:estimate-current-reverse-swap-total-fees}}
```
</section>
</custom-tabs>

The reverse swap will involve two on-chain transactions, for which the mining fees can only be estimated. They will happen
automatically once the process is started, but the last two values above are these estimates to help you get a picture
of the total costs.

Fetching the fees also tells you what is the range of amounts you can send:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_onchain.rs:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
println("Minimum amount, in sats: \(current_fees.min)")
println("Maximum amount, in sats: \(current_fees.max)")
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
Log.v("Breez", "Minimum amount, in sats: ${fees.min}")
Log.v("Breez", "Maximum amount, in sats: ${fees.max}")
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_onchain.ts:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
print("Minimum amount, in sats: ", current_fees.min)
print("Maximum amount, in sats: ", current_fees.max)
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_onchain.go:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:get-current-reverse-swap-min-max}}
```
</section>
</custom-tabs>

Once you checked the fees are acceptable, you can start the reverse swap:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_onchain.rs:start-reverse-swap}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
let destinationAddress = "bc1.."
let amountSat = currentFees.min
let satPerVbyte = <fee rate>
try {
  try sdk.sendOnchain(
    amountSat: amountSat,
    onchainRecipientAddress: destinationAddress, 
    pairHash: currentFees.feesHash,
    satPerVbyte: satPerVbyte)
} catch {
    // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
val address = "bc1.."
val amountSat = 123L.toULong()
val satPerVbyte = 1L.toULong()
try {
    sdk.sendOnchain(amountSat, address, fees.feesHash, satPerVbyte)
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_onchain.ts:start-reverse-swap}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:start-reverse-swap}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
destination_address = "bc1.."
amount_sat = 50000
sat_per_vbyte = 5
try:
  sdk_services.send_onchain(amount_sat=amount_sat,
                            onchain_recipient_address=destination_address,
                            pair_hash=current_fees.fee_hash,
                            sat_per_vbyte=sat_per_vbyte)
except Exception as error:
  # Handle erorr
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_onchain.go:start-reverse-swap}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:start-reverse-swap}}
```
</section>
</custom-tabs>

Starting the reverse swap will trigger a HODL invoice payment, which will only be settled if the entire swap completes.
This means you will see an outgoing pending payment in your list of payments, which locks those funds until the invoice
is either settled or cancelled. This will happen automatically at the end of the reverse swap.

You can check its status with:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_onchain.rs:check-reverse-swaps-status}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
for rs in sdk.inProgressReverseSwaps() {
  println("Reverse swap \(rs.id) in progress, status is \(rs.status)")
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
for (rs in sdk.inProgressReverseSwaps()) {
    Log.v("Breez", "Reverse swap ${rs.id} in progress, status is ${rs.status}")
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_onchain.ts:check-reverse-swaps-status}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:check-reverse-swaps-status}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
try: 
  reverse_swaps = sdk_services.in_progress_reverse_swaps()
  for rs in reverse_swaps:
    print("Reverse swap ",rs.id , " in progress, status is ", rs.status)
except Exception as error:
  # Handle erorr
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_onchain.go:check-reverse-swaps-status}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:check-reverse-swaps-status}}
```
</section>
</custom-tabs>

If the reverse swap is successful, you'll get the on-chain payment on your destination address and the HODL invoice will
change from pending to settled.

If however something goes wrong at any point in the process, the initial HODL payment will be cancelled and the funds in
your Breez SDK wallet will be unlocked.