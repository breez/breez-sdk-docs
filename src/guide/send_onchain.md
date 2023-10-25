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

```swift
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

<div slot="title">Android</div>
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

```dart
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">Python</div>
<section>

```python
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

```go
sendAmountSat := uint64(50000)
reverseSwapFeesRequest := breez_sdk.ReverseSwapFeesRequest{
    SendAmountSat: &sendAmountSat,
}
if currentFees, err := sdk.FetchReverseSwapFees(reverseSwapFeesRequest); err == nil {
    log.Printf("Total estimated fees for reverse swap: %v", currentFees.TotalEstimatedFees)
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
try
{
    var currentFees = sdk.FetchReverseSwapFees(
        new ReverseSwapFeesRequest(50000));
    Console.WriteLine($"Total estimated fees for reverse swap: {currentFees.totalEstimatedFees}");
}
catch (Exception)
{
    // Handle error
}
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

```swift
println("Minimum amount, in sats: \(current_fees.min)")
println("Maximum amount, in sats: \(current_fees.max)")
```
</section>

<div slot="title">Android</div>
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

```dart
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">Python</div>
<section>

```python
print("Minimum amount, in sats: ", current_fees.min)
print("Maximum amount, in sats: ", current_fees.max)
```
</section>

<div slot="title">Go</div>
<section>

```go
log.Printf("Minimum amount, in sats: %v", currentFees.Min)
log.Printf("Maximum amount, in sats: %v", currentFees.Max)
```
</section>

<div slot="title">C#</div>
<section>

```cs
Console.WriteLine($"Minimum amount, in sats: {currentFees.min}");
Console.WriteLine($"Maximum amount, in sats: {currentFees.max}");
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

```swift
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

<div slot="title">Android</div>
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

```dart
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:start-reverse-swap}}
```
</section>

<div slot="title">Python</div>
<section>

```python
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

```go
destinationAddress := "bc1.."
sendAmountSat := uint64(50000)
satPerVbyte := uint64(5)
if currentFees, err := sdk.FetchReverseSwapFees(breez_sdk.ReverseSwapFeesRequest{SendAmountSat: &sendAmountSat}); err == nil {
    if reverseSwapInfo, err := sdk.SendOnchain(sendAmountSat, destinationAddress, currentFees.FeesHash, satPerVbyte); err == nil {
        log.Printf("%#v", reverseSwapInfo)
    }
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
var destinationAddress = "bc1..";
var amountSat = currentFees.min;
var satPerVbyte = <fee rate>;
try 
{
    var reverseSwapInfo = sdk.SendOnchain(
        amountSat, destinationAddress, currentFees.feesHash, satPerVbyte);
} 
catch (Exception) 
{
    // Handle error
}
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

```swift
for rs in sdk.inProgressReverseSwaps() {
  println("Reverse swap \(rs.id) in progress, status is \(rs.status)")
}
```
</section>

<div slot="title">Android</div>
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

```dart
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:check-reverse-swaps-status}}
```
</section>

<div slot="title">Python</div>
<section>

```python
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

```go
if swaps, err := sdk.InProgressReverseSwaps(); err == nil {
    for _, swap := range swaps {
        log.Printf("Reverse swap %v in progress, status is %v", swap.Id, swap.Status)
    }
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
try 
{
    var swaps = sdk.InProgressReverseSwaps();
    foreach (var swap in swaps) {
        Console.WriteLine($"Reverse swap {swap.id} in progress, status is {swap.status}`");
    }
} 
catch (Exception) 
{
    // Handle error
}   
```
</section>
</custom-tabs>

If the reverse swap is successful, you'll get the on-chain payment on your destination address and the HODL invoice will
change from pending to settled.

If however something goes wrong at any point in the process, the initial HODL payment will be cancelled and the funds in
your Breez SDK wallet will be unlocked.