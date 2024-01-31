# Getting started

The Breez SDK enables mobile developers to integrate Lightning and bitcoin payments into their apps with a very shallow learning curve. The use cases are endless – from social apps that want to integrate tipping between users to content-creation apps interested in adding bitcoin monetization. Crucially, this SDK is an end-to-end, non-custodial, drop-in solution powered by Greenlight, a built-in LSP, on-chain interoperability, third-party fiat on-ramps, and other services users and operators need.

The Breez SDK provides the following services:

* Sending payments (via various protocols such as: bolt11, keysend, lnurl-pay, lightning address, btc address, etc.)
* Receiving payments (via various protocols such as: bolt11, lnurl-withdraw, btc address, etc.)
* Fetching node status (e.g. balance, max allow to pay, max allow to receive, on-chain balance, etc.)
* Connecting to a new or existing node.

Connecting to a node requires a seed (your master key). The seed is a bip39 mnemonic.

## Pricing

The Breez SDK is free for developers. 

## API Key and Invite Code

Before you start, you will need an API Key to use the SDK, as well as an Invite Code when you create a new node.

To get both of them, please contact Breez via email at <contact@breez.technology> or at <https://breez.technology/#contact-us-form>

## Support

Join this [telegram group](https://t.me/breezsdk) or email us at <contact@breez.technology>.

## Installing

Breez SDK is available in several platforms. Follow the [Installing](/guide/install.md) page for instructions on how to install on your platform.

## Connecting

The first step is to construct the SDK configuration. In it the environment and Greenlight node configuration is defined, whether you are using an invite code or partner credentials.

The SDK uses the config working directory to store the state of the SDK instance. Once a connection has been established with a node, the working directory can only be used for that node. When handling multiple instances of the SDK, one per node, each needs to have a different working directory defined.

Now you are ready to interact with the SDK.

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
{{#include ../../snippets/swift/BreezSDKExamples/Sources/GettingStarted.swift:init-sdk}}
```

</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/GettingStarted.kt:init-sdk}}
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
{{#include ../../snippets/python/src/getting_started.py:init-sdk}}
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

<div class="warning">
<h4>Developer note</h4>

By default the config working directory is set to `./`. Some platforms may require that you use an application specific directory that is writable within the application sandbox. For example applications running on Android or iOS.

</div>

## Getting the Node State

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
{{#include ../../snippets/swift/BreezSDKExamples/Sources/GettingStarted.swift:fetch-balance}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/GettingStarted.kt:fetch-balance}}
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
{{#include ../../snippets/python/src/getting_started.py:fetch-balance}}
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

You are now ready to receive a Lightning [payment](/guide/payments.md).
