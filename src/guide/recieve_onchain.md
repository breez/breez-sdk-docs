# Receive via Onchain
There are cases when you have funds in some bitcoin address and you would like to send those to your lightning node.

```rust
let swap_info = sdk.receive_onchain().await?;

// Send your funds to the bellow bitcoin address
let address = swap_info.bitcoin_address;
```

Once you send the funds to the above address the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap process to receive these into your lightning node.
You can always monitor the status of the current in progress swap using the follwing code:

```rust
let swap_info = sdk.in_progress_swap().await?
```

The process of receiving via onchain address is trustless and uses submarine swap. this means there are two ways to spend the sent funds:
1. Either by a preimage that is exposed when the lightning payment is completed - This is the positive case where the swap was succesfull.
2. Or by your node when the swap didn't complete in a certiain timeout - This is the negative case where your node will execute a refund.

In order to execute a refund you need to supply an onchain address to where the refunded amount will be sent to.
The following code will retrieve the refundable swaps:

```rust
let refundables = sdk.list_refundables().await?
```

Once you have a refundable swap in hand, use the follwing code to execute a refund:

```rust
let destination_address = "...".into()
let sat_per_byte = <efund tx fee rate>
sdk.refund(refundable.bitcoin_address, destination_address, sat_per_byte).await?
```
