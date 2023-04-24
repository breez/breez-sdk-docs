# Getting Started

Connecting to your node is the first step before attempting to send and receive lightning payments.

The SDK is implemented in rust and is made accessible to other languages using ffi binding.
Connecting to a node requires a seed (your master key) and credentials. The seed represents a bip39 mnemonics and the credentials are retrieved by registering a new node or recovering an existing one.

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

Once you got your credentials you should save them in a secure storage and then you are able to initialize the SDK and start using your node:

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

Now your node is ready to receive payments.