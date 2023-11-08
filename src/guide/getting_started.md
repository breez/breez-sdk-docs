# Getting Started

The Breez SDK enables mobile developers to integrate Lightning and bitcoin payments into their apps with a very shallow learning curve. The use cases are endless – from social apps that want to integrate tipping between users to content-creation apps interested in adding bitcoin monetization. Crucially, this SDK is an end-to-end, non-custodial, drop-in solution powered by Greenlight, a built-in LSP, on-chain interoperability, third-party fiat on-ramps, and other services users and operators need.

The Breez SDK provides the following services:

* Sending payments (via various protocols such as: bolt11, keysend, lnurl-pay, lightning address, etc.)
* Receiving payments (via various protocols such as: bolt11, lnurl-withdraw, etc.)
* Fetching node status (e.g. balance, max allow to pay, max allow to receive, on-chain balance, etc.)
* Connecting to a new or existing node.

Connecting to a node requires a seed (your master key). The seed is a bip39 mnemonic.

## Pricing

The Breez SDK is free for developers. 

## API Key and Invite Code

Before you start, you will need an API Key to use the SDK, as well as an Invite Code when you create a new node.

To get both of them, please contact Breez via email at <contact@breez.technology> or at <https://breez.technology/#contact-us-form>

## Support

Join this [telegram group](https://t.me/breezsdk).

## Installing

Breez SDK is available in several platforms. Follow the [Installing](install.md) page for instructions on how to install on your platform.

## Connecting

The first step is to construct the SDK configuration. In it the environment and Greenlight node configuration is defined, whether you are using an invite code or partner credentials.

The SDK uses the config working directory to store the state of the SDK instance. Once a connection has been established with a node, the working directory can only be used for that node. When handling multiple instances of the SDK, one per node, each needs to have a different working directory defined.

Now your SDK is ready to be used.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/getting_started.rs:init-sdk}}
```

</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
// SDK events listener
class SDKListener: EventListener {
  func onEvent(e: BreezEvent) {
    print("received event ", e)
  }
}

// Create the default config
let seed = try mnemonicToSeed(phrase: "<mnemonic words>")
let inviteCode = "<invite code>"
let apiKey = "<api key>"
let config = breez_sdk.defaultConfig(envType: EnvironmentType.production, apiKey: apiKey, 
    nodeConfig: NodeConfig.greenlight(
        config: GreenlightNodeConfig(partnerCredentials: nil, inviteCode: inviteCode)));    

// Customize the config object according to your needs
config.workingDir = "path to an existing directory"

do {
  // Connect to the Breez SDK make it ready for use
  let sdk = try connect(config: config, seed: seed, listener: SDKListener());        
} catch{
    // handle error
}
```

</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
// SDK events listener
class SDKListener : EventListener {
    override fun onEvent(e: BreezEvent) {
        Log.v("SDKListener", "Received event $e")
    }
}

// Select your seed, invite code and eviroment
val seed = mnemonicToSeed("<mnemonic words>")
val inviteCode = "<invite code>"
val apiKey = "<api key>"

// Create the default config
val greenlightNodeConfig = GreenlightNodeConfig(null, inviteCode)
val nodeConfig = NodeConfig.Greenlight(greenlightNodeConfig)
val config = defaultConfig(EnvironmentType.PRODUCTION, apiKey, nodeConfig)

// Customize the config object according to your needs
config.workingDir = "path to an existing directory"

try {
    // Connect to the Breez SDK make it ready for use
    val sdk = connect(config, seed, SDKListener())
} catch (e: Exception) {
    // handle error
}
```

</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/getting_started.ts:init-sdk}}
```

</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/getting_started.dart:init-sdk}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
# SDK events listener
class SDKListener(breez_sdk.EventListener):
   def on_event(self, event):
      print(event)

# Create the default config
seed = mnemonic_to_seed("<mnemonic words>")
invite_code = "<invite code>"
api_key = "<api key>"
config = breez_sdk.default_config(breez_sdk.EnvironmentType.PRODUCTION, apiKey,  
    breez_sdk.NodeConfig.GREENLIGHT(breez_sdk.GreenlightNodeConfig(None, invite_code)))

# Customize the config object according to your needs
config.working_dir = "path to an existing directory"

try:
    # Connect to the Breez SDK make it ready for use
    sdk_services = breez_sdk.connect(config, seed, SDKListener())    
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/getting_started.go:init-sdk}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/GettingStarted.cs:init-sdk}}
```
</section>
</custom-tabs>

At any point we can fetch our balance from the Greenlight node:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/getting_started.rs:fetch-balance}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
do {
  let nodeInfo = try sdk.nodeInfo()
  let lnBalance = nodeInfo?.channelsBalanceMsat
  let onchainBalance = nodeInfo?.onchainBalanceMsat
} catch {
  // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
try {
    val nodeInfo = sdk.nodeInfo()
    val lnBalance = nodeInfo?.channelsBalanceMsat
    val onchainBalance = nodeInfo?.onchainBalanceMsat
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/getting_started.ts:fetch-balance}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/getting_started.dart:fetch-balance}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
try: 
    node_info = node_info()
    ln_balance = node_info.channels_balance_msat
    onchain_balance = node_info.onchain_balance_msat
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/getting_started.go:fetch-balance}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/GettingStarted.cs:fetch-balance}}
```
</section>
</custom-tabs>

You are now ready to receive a Lightning [payment](payments.md).
