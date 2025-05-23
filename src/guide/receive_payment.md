<h1 id="receiving-lightning-payments">
    <a class="header" href="#receiving-lightning-payments">Receiving Lightning payments</a>
    <a class="tag" target="_blank" href="https://breez.github.io/breez-sdk-greenlight/breez_sdk_core/struct.BreezServices.html#method.receive_payment">API docs</a>
</h1>

With the Breez SDK you aren't required to open a channel and set up your inbound liquidity.
The Breez SDK automatically connects your node to the LSP peer and you can now receive payments.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/receive_payment.rs:receive-payment}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ReceivePayment.swift:receive-payment}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ReceivePayment.kt:receive-payment}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/receive_payment.ts:receive-payment}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/receive_payment.dart:receive-payment}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/receive_payment.py:receive-payment}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/receive_payment.go:receive-payment}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ReceivePayment.cs:receive-payment}}
```
</section>
</custom-tabs>
<div class="warning">
<h4>Developer note</h4>
Consider implementing the <a href="/notifications/getting_started.md">Notification Plugin</a> when using the Breez SDK in a mobile application. By registering a webhook the application can receive a payment notification to process the payment in the background.
</div>

<h2 id="calculating-fees">
    <a class="header" href="#calculating-fees">Calculating fees</a>
    <a class="tag" target="_blank" href="https://breez.github.io/breez-sdk-greenlight/breez_sdk_core/struct.BreezServices.html#method.open_channel_fee">API docs</a>
</h2>

When the amount to be received exceeds the inbound liquidity of the node, a new channel will be opened by the LSP in order for the node to receive it. This can checked by retrieving the NodeState from the SDK and comparing the inbound liquidity to the amount to be received. If the amount is greater or equal to the inbound liquidity, a new channel opening is required.

To calculate the fees for a channel being opened by the LSP:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/receive_onchain.rs:get-channel-opening-fees}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore 
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ReceiveOnchain.swift:get-channel-opening-fees}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ReceiveOnchain.kt:get-channel-opening-fees}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript 
{{#include ../../snippets/react-native/receive_onchain.ts:get-channel-opening-fees}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/receive_onchain.dart:get-channel-opening-fees}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/receive_onchain.py:get-channel-opening-fees}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/receive_onchain.go:get-channel-opening-fees}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore 
{{#include ../../snippets/csharp/ReceiveOnchain.cs:get-channel-opening-fees}}
```
</section>
</custom-tabs>

[^1]: For more details on these fees, see [Channel Opening Fees](connecting_lsp.md#channel-opening-fees)
