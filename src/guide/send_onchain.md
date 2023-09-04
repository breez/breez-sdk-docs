# Sending an on-chain transaction (swap-out)

You can send funds from the Breez SDK wallet to an on-chain address as follows.

First, fetch the current reverse swap fees:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let current_fees = sdk.fetch_reverse_swap_fees(
    ReverseSwapFeesRequest {
        send_amount_sat: Some(50000),
    })
    .await?;

info!("Total estimated fees for reverse swap: {}", current_fees.total_estimated_fees);
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
try {
    const currentFees = await fetchReverseSwapFees({sendAmountSat: 50000})

    console.log(`Total estimated fees for reverse swap: ${currentFees.totalEstimatedFees}`);
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    ReverseSwapPairInfo currentFees = await fetchReverseSwapFees(ReverseSwapFeesRequest(50000));

    print("Total estimated fees for reverse swap: ${currentFees.totalEstimatedFees}");
} catch (error) {
    // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
try: 
  current_fees = sdk_services.fetch_reverse_swap_fees(
    breez_sdk.ReverseSwapFeesRequest(
        send_amount_sat=50000))
  print("Total estimated fees for reverse swap:", current_fees.total_estimated_fees)
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
if currentFees, err := sdkService.FetchReverseSwapFees(reverseSwapFeesRequest); err != nil {
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
info!("Minimum amount, in sats: {}", current_fees.min);
info!("Maximum amount, in sats: {}", current_fees.max);
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
console.log(`Minimum amount, in sats: ${currentFees.min}`);
console.log(`Maximum amount, in sats: ${currentFees.max}`);
```
</section>

<div slot="title">Dart</div>
<section>

```dart
print("Minimum amount, in sats: ${currentFees.min}");
print("Maximum amount, in sats: ${currentFees.max}");
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
let destination_address = String::from("bc1..");
let amount_sat = current_fees.min;
let satPerVbyte = <fee rate>;

sdk.send_onchain(amount_sat, destination_address, current_fees.fees_hash, satPerVbyte).await?;
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
const destinationAddress = "bc1..";
const amountSat = currentFees.min;
const satPerVbyte = <fee rate>
try {
    const reverseSwapInfo = sendOnchain(amountSat, destinationAddress, currentFees.feesHash, satPerVbyte)
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
String destinationAddress = "bc1..";
int amountSat = <amount>;
int satPerVbyte = <fee rate>
try {
    ReverseSwapInfo reverseSwapInfo = await sendOnchain(
        amountSat: amountSat,
        onchainRecipientAddress: destinationAddress,
        pairHash: currentFees.feesHash,
        satPerVbyte: satPerVbyte,
    );
} catch (error) {
    // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
destination_address = "bc1.."
amount_sat = current_fees.min
fee_hash = current_fees.fee_hash
sat_per_vbyte = <fee rate>

try:
  sdk_services.send_onchain(
    amount_sat=amount_msats,
    onchain_recipient_address="...",
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
amountSat := currentFees.Min
satPerVbyte := <fee rate>

reverseSwapInfo, err := sdkServices.SendOnchain(amountSat, destinationAddress, currentFees.FeesHash, satPerVbyte)
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
for rs in sdk.in_progress_reverse_swaps().await? {
    info!("Reverse swap {} in progress, status is {}", rs.id, rs.status);
}
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
try {
    const swaps = await inProgressReverseSwaps()
    for (const swap in swaps) {
        println(`Reverse swap ${swap.id} in progress, status is ${swap.status}`);
    }
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    List<ReverseSwapInfo> swaps = await inProgressReverseSwaps();
    for (swap in swaps) {
        print(`Reverse swap ${swap.id} in progress, status is ${swap.status}`);
    }
} catch (error) {
    // handle error
}
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
if swaps, err := sdkServices.InProgressReverseSwaps(); err != nil {
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