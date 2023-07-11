# Getting Started

The Breez SDK enables mobile developers to integrate Lightning and bitcoin payments into their apps with a very shallow learning curve. The use cases are endless – from social apps that want to integrate tipping between users to content-creation apps interested in adding bitcoin monetization. Crucially, this SDK is an end-to-end, non-custodial, drop-in solution powered by Greenlight, a built-in LSP, on-chain interoperability, third-party fiat on-ramps, and other services users and operators need.

The Breez SDK provides the following services:

* Sending payments (via various protocols such as: bolt11, keysend, lnurl-pay, lightning address, etc.)
* Receiving payments (via various protocols such as: bolt11, lnurl-withdraw, etc.)
* Fetching node status (e.g. balance, max allow to pay, max allow to receive, on-chain balance, etc.)
* Connecting to a new or existing node.

Connecting to a node requires a seed (your master key). The seed is a bip39 mnemonic.

## Installing

Breez SDK is available in several platforms. Follow the [Installing](install.md) page for instructions on how to install on your platform.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

## Connecting
```rust,no_run
// Create the default config
let config = BreezServices::default_config(
    EnvironmentType::Production,
    "your API key".into(),
    breez_sdk_core::NodeConfig::Greenlight {
        config: GreenlightNodeConfig {
            partner_credentials: None,
            invite_code: None,
        },
    },
);

// Customize the config object according to your needs
config.working_dir = "path to an existing directory".into();

// Connect to the Breez SDK make it ready for use
let sdk = BreezServices::connect(
        config,
        seed.to_vec(),        
        Box::new(AppEventListener {}),
    )
    .await?;
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

## Connecting
```swift

// SDK events listener
class SDKListener: EventListener {
  func onEvent(e: BreezEvent) {
    print("received event ", e)
  }
}

// Create the default config
let seed = try mnemonicToSeed(phrase: "<mnemonics words>")
let inviteCode = "your invite code"
let config = breez_sdk.defaultConfig(envType: EnvironmentType.production, apiKey: "", 
    nodeConfig: NodeConfig.greenlight(
        config: GreenlightNodeConfig(partnerCredentials: nil,inviteCode:  inviteCode)));    

// Customize the config object according to your needs
config.workingDir = "path to an existing directory"

do {
  // Connect to the Breez SDK make it ready for use
  let sdk = try connect(config: config, seed: seed, listener: SDKListener());        
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

## Connecting
```typescript

// SDK events listener
addEventListener((type, data) => {
    console.log(`received event ${type}`);
})

// Create the default config
const seed = await mnemonicToSeed("<mnemonics words>");
const inviteCode = "<your greenlight invite code>";
const nodeConfig : NodeConfig = {
    type: NodeConfigType.GREENLIGHT,
    config: {
        inviteCode: "your invite code"        
    }
}
let config = defaultConfig(EnvironmentType.PRODUCTION, "api key", nodeConfig);

// Customize the config object according to your needs
config.workingDir = "path to an existing directory";

try {
    // Connect to the Breez SDK make it ready for use
    const sdkServices = await connect(config, seed);
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

## Connecting
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
Uint8List seed = await mnemonicToSeed(phrase: "<mnemonic words>");
String inviteCode = "<your greenlight invite code>";
NodeConfg nodeConfig = NodeConfig.greenlight(config: GreenlightNodeConfig(partnerCredentials: null, inviteCode: inviteCode));
Config config = await defaultConfig(configType: EnvironmentType.Production, apiKey: "", nodeConfig: nodeConfig);

// Customize the config object according to your needs
config.workingDir = "path to an existing directory";

try {
    // Connect to the Breez SDK make it ready for use
    await connect(config: config, seed: seed);    
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

## Connecting
```python
# SDK events listener
class SDKListener(breez_sdk.EventListener):
   def on_event(self, event):
      print(event)

# Create the default config
seed = mnemonic_to_seed("<mnemonics words>")
invite_code = "<your greenlight invite code>"
config = breez_sdk.default_config(breez_sdk.EnvironmentType.PRODUCTION, "api key",  
    breez_sdk.NodeConfig.GREENLIGHT(breez_sdk.GreenlightNodeConfig(None, invite_code)))

# Customize the config object according to your needs
config.working_dir = "path to an existing directory"

try:
    # Connect to the Breez SDK make it ready for use
    sdk_services = breez_sdk.connect(config, seed, SDKListener())    
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
