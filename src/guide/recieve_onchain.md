# Receiving an on-chain transaction (swap-in)
There are cases when you have funds in some bitcoin address and you would like to send those to your lightning node.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,no_run
let swap_info = sdk.receive_onchain().await?;

// Send your funds to the bellow bitcoin address
let address = swap_info.bitcoin_address;
```

Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

```rust,no_run
let swap_info = sdk.in_progress_swap().await?
```

The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout - this is the negative case where your node will execute a refund.

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:

```rust,no_run
let refundables = sdk.list_refundables().await?
```

Once you have a refundable swap in hand, use the follwing code to execute a refund:

```rust,no_run
let destination_address = "...".into()
let sat_per_vbyte = <refund tx fee rate>
sdk.refund(refundable.bitcoin_address, destination_address, sat_per_vbyte).await?
```
</section>
<div slot="title">Swift</div>
<section>

```swift
do {
 let swapInfo = try sdk.receiveOnchain();

 // Send your funds to the bellow bitcoin address
 let address = swapInfo.bitcoinAddress;
} catch {
    // handle error
}
```

Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

```swift
do {
 let swapInfo = try sdk.inProgressSwap()
} catch {
    // handle error
}
```

The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout - this is the negative case where your node will execute a refund.

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:

```swift
do {
 let refundables = try sdk.listRefundables()
} catch {
    // handle error
}
```

Once you have a refundable swap in hand, use the follwing code to execute a refund:

```swift
let destinationAddress = "..."
let satPerVbyte = <refund tx fee rate>

do {
 try sdk.refund(
  swapAddress: "",
  toAddress: destinationAddress,
  satPerVbyte: satPerVbyte)
} catch {
    // handle error
}
```
</section>
</custom-tabs>