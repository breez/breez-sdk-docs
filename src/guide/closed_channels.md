# Handling channel closures

When channels are closed (due to a misbehaving node or by the LSP), the remaining funds are sent to an on-chain address. To redeem these funds please follow the steps below.

<h2 id="preparing-the-transaction">
    <a class="header" href="#preparing-the-transaction">Preparing the transaction</a>
    <a class="tag" target="_blank" href="https://breez.github.io/breez-sdk-greenlight/breez_sdk_core/struct.BreezServices.html#method.prepare_redeem_onchain_funds">API docs</a>
</h2>

Prepare the transaction to retrieve its weight and the calculated fees before broadcasting it:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/closed_channel.rs:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ClosedChannel.swift:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ClosedChannel.kt:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/closed_channel.ts:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/closed_channel.dart:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/closed_channel.py:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/closed_channel.go:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ClosedChannel.cs:prepare-redeem-onchain-funds}}
```
</section>
</custom-tabs>

<h2 id="redeeming-the-on-chain-funds">
    <a class="header" href="#redeeming-the-on-chain-funds">Redeeming the on-chain funds</a>
    <a class="tag" target="_blank" href="https://breez.github.io/breez-sdk-greenlight/breez_sdk_core/struct.BreezServices.html#method.redeem_onchain_funds">API docs</a>
</h2>

Redeem the on-chain funds by broadcasting the transaction to the network:
 
<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/closed_channel.rs:redeem-onchain-funds}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ClosedChannel.swift:redeem-onchain-funds}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ClosedChannel.kt:redeem-onchain-funds}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/closed_channel.ts:redeem-onchain-funds}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/closed_channel.dart:redeem-onchain-funds}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/closed_channel.py:redeem-onchain-funds}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/closed_channel.go:redeem-onchain-funds}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ClosedChannel.cs:redeem-onchain-funds}}
```
</section>
</custom-tabs>
