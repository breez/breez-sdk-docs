# Sending and receiving Lightning payments

## Receiving Lightning Payments
Breez SDK doesn't require you to open a channel and set up your inbound liquidity.
Breez SDK automatically connects your node to the LSP peer and you can now receive payments:

```rust
let invoice = sdk.receive_payment(3000, "Invoice for 3000 sats".into()).await?;
```

Or make payments

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

