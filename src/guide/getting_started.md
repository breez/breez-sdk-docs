# Getting Started

The Breez SDK enables mobile developers to integrate Lightning and bitcoin payments into their apps with a very shallow learning curve. The use cases are endless – from social apps that want to integrate tipping between users to content-creation apps interested in adding bitcoin monetization. Crucially, this SDK is an end-to-end, non-custodial, drop-in solution powered by Greenlight, a built-in LSP, on-chain interoperability, third-party fiat on-ramps, and other services users and operators need.

The Breez SDK provides the following services:

* Sending payments (via various protocols such as: bolt11, keysend, lnurl-pay, lightning address, etc.)
* Receiving payments (via various protocols such as: bolt11, lnurl-withdraw, etc.)
* Fetching node status (e.g. balance, max allow to pay, max allow to receive, on-chain balance, etc.)
* Connecting to a new or existing node.

Connecting to a node requires a seed (your master key) and credentials. The seed is a bip39 mnemonic and the credentials are retrieved by registering a new node or recovering an existing one.

## Registering a new node
```rust
let seed = <your seed>;
let credentials = BreezServices::register_node(Network::Bitcoin, seed).await?;
```

## Recovering an existing node
```rust
let seed = <your seed>;
let credentials = BreezServices::register_node(Network::Bitcoin, seed).await?;
```

Once the credentials are retrieved they should be saved in a secured storage.
The next step is to initialize the SDK and start the node:

## Initializing the SDK
```rust
// Create the default config
let config = BreezServices::default_config(EnvironmentType::Production)

// Customize the config object according to your needs
config.api_key = Some("your API key".into());
config.working_dir = "path to an existing directory".into();

let sdk = BreezServices::init_services(
        config,
        seed.to_vec(),
        credentials.clone(),
        Box::new(AppEventListener {}),
    )
    .await?;

BreezServices::start(rt(), &sdk).await?;
```

At any point we can fetch our balance from the Greenlight node

```rust
if let Some(node_state) = sdk.node_info()? {
    let balance_ln = node_state.channels_balance_msat;
    let balance_onchain = node_state.onchain_balance_msat;
}
```
We are now ready to receive [payments](guide/payments.md)