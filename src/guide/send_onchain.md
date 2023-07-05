# Sending an on-chain transaction (swap-out)

You can send funds from the Breez SDK wallet to an on-chain address as follows.

First, fetch the current reverse swap fees:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,no_run
let current_fees = sdk.fetch_reverse_swap_fees().await?;

info!("Percentage fee for the reverse swap service: {}", current_fees.fees_percentage);
info!("Estimated miner fees in sats for locking up funds: {}", current_fees.fees_lockup);
info!("Estimated miner fees in sats for claiming funds: {}", current_fees.fees_claim);
```

The reverse swap will involve two on-chain transactions, for which the mining fees can only be estimated. They will happen
automatically once the process is started, but the last two values above are these estimates to help you get a picture
of the total costs.

Fetching the fees also tells you what is the range of amounts you can send:

```rust,no_run
info!("Minimum amount, in sats: {}", current_fees.min);
info!("Maximum amount, in sats: {}", current_fees.max);
```

Once you checked the fees are acceptable, you can start the reverse swap:

```rust,no_run
let destination_address = String::from("bc1..");
let amount_sat = current_fees.min;

sdk.send_onchain(amount_sat, destination_address, current_fees.fees_hash).await?;
```

Starting the reverse swap will trigger a HODL invoice payment, which will only be settled if the entire swap completes.
This means you will see an outgoing pending payment in your list of payments, which locks those funds until the invoice
is either settled or cancelled. This will happen automatically at the end of the reverse swap.

You can check its status with:

```rust,no_run
for rs in sdk.in_progress_reverse_swaps().await? {
    info!("Reverse swap {} in progress, status is {}", rs.id, rs.breez_status);
}
```
</section>
<div slot="title">Swift</div>
<section>

```swift
try {
  let currentFees = try sdk.fetchReverseSwapFees()

  println("Percentage fee for the reverse swap service: \(currentFees.feesPercentage)")
  println("Estimated miner fees in sats for locking up funds: \(currentFees.feesLockup)")
  println("Estimated miner fees in sats for claiming funds: \(currentFees.feesClaim)")
} catch {
    // handle error
}
```

The reverse swap will involve two on-chain transactions, for which the mining fees can only be estimated. They will happen
automatically once the process is started, but the last two values above are these estimates to help you get a picture
of the total costs.

Fetching the fees also tells you what is the range of amounts you can send:

```swift
println("Minimum amount, in sats: \(current_fees.min)")
println("Maximum amount, in sats: \(current_fees.max)")
```

Once you checked the fees are acceptable, you can start the reverse swap:

```swift
let destinationAddress = "bc1.."
let amountSat = currentFees.min
let satPerVbyte = <fee rate>
try {
  try sdk.sendOnchain(amountSat: amountSat, onchainRecipientAddress: destinationAddress, pairHash: currentFees.feesHash, satPerVbyte: satPerVbyte)
} catch {
    // handle error
}
```

Starting the reverse swap will trigger a HODL invoice payment, which will only be settled if the entire swap completes.
This means you will see an outgoing pending payment in your list of payments, which locks those funds until the invoice
is either settled or cancelled. This will happen automatically at the end of the reverse swap.

You can check its status with:

```swift
for rs in sdk.inProgressReverseSwaps() {
  println("Reverse swap \(rs.id) in progress, status is \(rs.breezStatus)")
}
```
</section>
<div slot="title">React Native</div>
<section>

```typescript
try {
    const currentFees = await fetchReverseSwapFees()

    console.log(`Percentage fee for the reverse swap service: ${currentFees.feesPercentage}`);
    console.log(`Estimated miner fees in sats for locking up funds: ${currentFees.feesLockup}`);
    console.log(`Estimated miner fees in sats for claiming funds: ${currentFees.feesClaim}`);
} catch (error) {
    console.log(error)
}
```

The reverse swap will involve two on-chain transactions, for which the mining fees can only be estimated. They will happen
automatically once the process is started, but the last two values above are these estimates to help you get a picture
of the total costs.

Fetching the fees also tells you what is the range of amounts you can send:

```typescript
console.log(`Minimum amount, in sats: ${currentFees.min}`);
console.log(`Maximum amount, in sats: ${currentFees.max}`);
```

Once you checked the fees are acceptable, you can start the reverse swap:

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

Starting the reverse swap will trigger a HODL invoice payment, which will only be settled if the entire swap completes.
This means you will see an outgoing pending payment in your list of payments, which locks those funds until the invoice
is either settled or cancelled. This will happen automatically at the end of the reverse swap.

You can check its status with:

```typescript
try {
    const swaps = await inProgressReverseSwaps()
    for (const swap in swaps) {
        println(`Reverse swap ${swap.id} in progress, status is ${swap.breezStatus}`);
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
    ReverseSwapPairInfo currentFees = await fetchReverseSwapFees();

    print(`Percentage fee for the reverse swap service: ${currentFees.feesPercentage}`);
    print(`Estimated miner fees in sats for locking up funds: ${currentFees.feesLockup}`);
    print(`Estimated miner fees in sats for claiming funds: ${currentFees.feesClaim}`);
} catch (error) {
    // handle error
}
```

The reverse swap will involve two on-chain transactions, for which the mining fees can only be estimated. They will happen
automatically once the process is started, but the last two values above are these estimates to help you get a picture
of the total costs.

Fetching the fees also tells you what is the range of amounts you can send:

```dart
print(`Minimum amount, in sats: ${currentFees.min}`);
print(`Maximum amount, in sats: ${currentFees.max}`);
```

Once you checked the fees are acceptable, you can start the reverse swap:

```dart
String destinationAddress = "bc1..";
int amountSat = currentFees.min;
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

Starting the reverse swap will trigger a HODL invoice payment, which will only be settled if the entire swap completes.
This means you will see an outgoing pending payment in your list of payments, which locks those funds until the invoice
is either settled or cancelled. This will happen automatically at the end of the reverse swap.

You can check its status with:

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
</custom-tabs>
If the reverse swap is successful, you'll get the on-chain payment on your destination address and the HODL invoice will
change from pending to settled.

If however something goes wrong at any point in the process, the initial HODL payment will be cancelled and the funds in
your Breez SDK wallet will be unlocked.