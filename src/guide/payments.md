# Payments

## Receiving Lightning Payments
Breez SDK doesn't require you to open a channel and set up your inbound liquidity. at this stage your node should already be connected to the LSP peer and you can use the follwing code to receive payments:

```rust
let invoice = sdk.receive_payment(3000, "Invoice for 3000 sats".into()).await?;
```

The above will create an invoice that is ready to be paid.
Once this invoice is paid the LSP connected to your node will open a JIT (just in time) channel to your node and forward the amount minus some setup fee.

## Sending Lightning Payments
```rust
let bolt11 = "...";
sdk.send_payment(bolt11.into(), Some(3000)).await?;
```

## Sending Spontaneus Lightning Payments
```rust
let node_id = "...";
sdk.send_payment(node_id.into(), Some(3000)).await?;
```

