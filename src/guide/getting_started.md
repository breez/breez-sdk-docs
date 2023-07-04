# Getting Started

The Breez SDK enables mobile developers to integrate Lightning and bitcoin payments into their apps with a very shallow learning curve. The use cases are endless – from social apps that want to integrate tipping between users to content-creation apps interested in adding bitcoin monetization. Crucially, this SDK is an end-to-end, non-custodial, drop-in solution powered by Greenlight, a built-in LSP, on-chain interoperability, third-party fiat on-ramps, and other services users and operators need.

The Breez SDK provides the following services:

* Sending payments (via various protocols such as: bolt11, keysend, lnurl-pay, lightning address, etc.)
* Receiving payments (via various protocols such as: bolt11, lnurl-withdraw, etc.)
* Fetching node status (e.g. balance, max allow to pay, max allow to receive, on-chain balance, etc.)
* Connecting to a new or existing node.

Connecting to a node requires a seed (your master key) and credentials. The seed is a bip39 mnemonic and the credentials are retrieved by registering a new node or recovering an existing one.

## Installing

Breez SDK is available in several platforms. Follow the [Installing](install.md) page for instructions on how to install on your platform.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

The first step is to register a new node. In order to do that a seed is needed.
## Registering a new node
```rust,no_run
let seed = <your seed>;
let invite_code = <your greenlight invite code>;

// register_node takes either greenlight credentials (certifate & key) or invite code. 
// At this example we are using the invite code option.
let credentials = BreezServices::register_node(Network::Bitcoin, seed, None, Some(invite_code)).await?;
```

## Recovering an existing node
```rust,no_run
let seed = <your seed>;
let credentials = BreezServices::recover_node(Network::Bitcoin, seed).await?;
```

Once the credentials are retrieved they should be saved in a secured storage.
The next step is to initialize the SDK and start the node:

## Initializing the SDK
```rust,no_run
// Create the default config
let mut config = BreezServices::default_config(EnvironmentType::Production);

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

At any point we can fetch our balance from the Greenlight node:

```rust,no_run
if let Some(node_state) = sdk.node_info()? {
    let balance_ln = node_state.channels_balance_msat;
    let balance_onchain = node_state.onchain_balance_msat;
}
```
</section>
<div slot="title">Swift</div>
<section>

The first step is to register a new node. In order to do that a seed is needed.
## Registering a new node
```swift
do {
 let seed = try mnemonicToSeed(phrase: "<mnemonics words>")
 let inviteCode = ""

 // register_node takes either greenlight credentials (certifate & key) or invite code.
 // At this example we are using the invite code option.
 let credentials = try registerNode(network: Network.bitcoin, seed: seed, registerCredentials: nil,  inviteCode: inviteCode)
} catch  {
  // handle error
}
```

## Recovering an existing node
```swift
do {
  let seed = try mnemonicToSeed(phrase: "<mnemonics words>")
  let credentials = try recoverNode(network: Network.bitcoin, seed: seed)
} catch  {
  // handle error
}
```

Once the credentials are retrieved they should be saved in a secured storage.
The next step is to initialize the SDK and start the node:

## Initializing the SDK
```swift

// SDK events listener
class SDKListener: EventListener {
  func onEvent(e: BreezEvent) {
    print("received event ", e)
  }
}

// Create the default config
var config = defaultConfig(envType: EnvironmentType.production)

// Customize the config object according to your needs
config.apiKey = "your API key"
config.workingDir = "path to an existing directory"

do { 
  let sdk = try initServices(config: config, seed: seed, creds: credentials, listener: SDKListener());
  try sdk.start();
} catch{
    // handle error
}
```

At any point we can fetch our balance from the Greenlight node:

```swift
do {
  let nodeInfo = try sdk.nodeInfo()
  let lnBalance = nodeInfo?.channelsBalanceMsat
  let onchainBalance = nodeInfo?.onchainBalanceMsat
} catch {
  // handle error
}
```

</section>
<div slot="title">React Native</div>
<section>

The first step is to register a new node. In order to do that a seed is needed.
## Registering a new node
```typescript
try {
    const seed = await mnemonicToSeed("<mnemonics words>");
    const inviteCode = "<your greenlight invite code>";

    // register_node takes either greenlight credentials (certifate & key) or invite code. 
    // At this example we are using the invite code option.
    const credentials = await registerNode(Network.BITCOIN, seed, null, inviteCode); 
} catch (error) {
    console.log(error)
}
```

## Recovering an existing node
```typescript
    const seed = await mnemonicToSeed("<mnemonics words>");
    const credentials = await recoverNode(Network.BITCOIN, seed);
```

Once the credentials are retrieved they should be saved in a secured storage.
The next step is to initialize the SDK and start the node:

## Initializing the SDK
```typescript

// SDK events listener
addEventListener((type, data) => {
    console.log(`received event ${type}`);
})

// Create the default config
let config = defaultConfig(EnvironmentType.PRODUCTION)

// Customize the config object according to your needs
config.apiKey = "your API key";
config.workingDir = "path to an existing directory";

try {
    const sdkServices = await initServices(config, credentials.deviceKey, credentials.deviceCert, seed);
    await start();
} catch (error) {
    console.log(error);
}
```

At any point we can fetch our balance from the Greenlight node:

```typescript
try {
    const nodeInfo = await nodeInfo();
    const lnBalance = nodeInfo.channelsBalanceMsat;
    const onchainBalance = nodeInfo.onchainBalanceMsat;
} catch (error) {
    console.log(error);
}
```
</section>
<div slot="title">Dart</div>
<section>

The first step is to register a new node. In order to do that a seed is needed.
## Registering a new node
```dart
try {
    Config config = await defaultConfig(configType: EnvironmentType.Production);
    Uint8List seed = await mnemonicToSeed(phrase: "<mnemonic words>");
    String inviteCode = "<your greenlight invite code>";

    // registerNode takes either greenlight credentials (certifate & key) or invite code.
    // At this example we are using the invite code option.
    GreenlightCredentials credentials = await registerNode(network: Network.Bitcoin, seed: seed, config: config, inviteCode: inviteCode);
} catch (error) {
    // handle error
}
```

## Recovering an existing node
```dart
    Config config = await defaultConfig(configType: EnvironmentType.Production);
    Uint8List seed = await mnemonicToSeed("<mnemonics words>");
    GreenlightCredentials credentials = await recoverNode(network: Network.Bitcoin, seed: seed, config: config);
```
## Initializing the SDK
```dart
// SDK events listener
breezEventsStream().listen((event) {
    print("Received Breez event: $event");
}

// SDK logs listener
breezLogStream().listen((log) {
    print("Received Breez log entry: $log");
}

// Create the default config
Config config = await defaultConfig(configType: EnvironmentType.Production);

// Customize the config object according to your needs
config.apiKey = "your API key";
config.workingDir = "path to an existing directory";

try {
    await initServices(config: config, seed: seed, creds: creds);
    await startNode();
} catch (error) {
   // handle error
}
```
At any point we can fetch our balance from the Greenlight node:

```dart
try {
    NodeState? nodeInfo = await nodeInfo();    
    int lnBalance = nodeInfo?.channelsBalanceMsat;
    int onchainBalance = nodeInfo?.onchainBalanceMsat;
} catch (error) {
    // handle error
}
```
</section>
<div slot="title">Python</div>
<section>

The first step is to register a new node. In order to do that a seed is needed.

## Registering a new node
```python
try :
    seed = mnemonic_to_seed("<mnemonics words>")
    invite_code = "<your greenlight invite code>"

    # register_node takes either greenlight credentials (certifate & key) or invite code. 
    # At this example we are using the invite code option.
    credentials = register_node(Network.BITCOIN, seed, inviteCode)
except Exception as error:
    # Handle error
```

## Recovering an existing node
```python
seed = mnemonic_to_seed("<mnemonics words>")
credentials = recover_node(Network.BITCOIN, seed)
```

Once the credentials are retrieved they should be saved in a secured storage.
The next step is to initialize the SDK and start the node:

## Initializing the SDK
```python
# SDK events listener
class SDKListener(breez_sdk.EventListener):
   def on_event(self, event):
      print(event)

# Create the default config
config = default_config(EnvironmentType.PRODUCTION)

# Customize the config object according to your needs
config.api_key = "your API key"
config.working_dir = "path to an existing directory"

try:
    sdk_services = init_services(config,seed,creds,SDKListener())
    sdk_services.start()
except Exception as error:
    # Handle error
```

At any point we can fetch our balance from the Greenlight node:

```python
try: 
    node_info = node_info()
    ln_balance = node_info.channels_balance_msat
    onchain_balance = node_info.onchain_balance_msat
except Exception as error:
    # Handle error
```
</section>
</custom-tabs>

You are now ready to receive a Lightning [payment](payments.md).
