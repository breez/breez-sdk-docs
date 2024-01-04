# Receiving an on-chain transaction (Swap-In)

There are cases when you have funds in some bitcoin address and you would like to send those to your lightning node.

In such cases, the SDK might have to open a new channel, for which case you can specify an optional user-selected
channel opening fee[^1].
In order to receive funds you first have to be connected to an [LSP](connecting_lsp.md).

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/receive_onchain.rs:generate-receive-onchain-address}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ReceiveOnchain.swift:generate-receive-onchain-address}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ReceiveOnchain.kt:generate-receive-onchain-address}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/receive_onchain.ts:generate-receive-onchain-address}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/receive_onchain.dart:generate-receive-onchain-address}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/receive_onchain.py:generate-receive-onchain-address}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/receive_onchain.go:generate-receive-onchain-address}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ReceiveOnchain.cs:generate-receive-onchain-address}}
```
</section>
</custom-tabs>

<div class="warning">
<h4>Developer note</h4>

The `swap_info` above includes maximum and minimum limits. Your application's users must be informed of these limits because if the amount transferred to the swap address falls outside this valid range, the funds will not be successfully received via lightning. In such cases, a refund will be necessary.

</div>


## Get the in-progress Swap

Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/receive_onchain.rs:in-progress-swap}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ReceiveOnchain.swift:in-progress-swap}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ReceiveOnchain.kt:in-progress-swap}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/receive_onchain.ts:in-progress-swap}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/receive_onchain.dart:in-progress-swap}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/receive_onchain.py:in-progress-swap}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore

{{#include ../../snippets/go/receive_onchain.go:in-progress-swap}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ReceiveOnchain.cs:in-progress-swap}}
```
</section>
</custom-tabs>

The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout (216 blocks) - this is the negative case where your node will execute a refund (funds become refundable after 288 blocks). Refund will also be available in case the amount sent wasn't within the limits.

## Refund a Swap

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/receive_onchain.rs:list-refundables}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ReceiveOnchain.swift:list-refundables}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ReceiveOnchain.kt:list-refundables}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/receive_onchain.ts:list-refundables}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/receive_onchain.dart:list-refundables}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/receive_onchain.py:list-refundables}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/receive_onchain.go:list-refundables}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ReceiveOnchain.cs:list-refundables}}
```
</section>
</custom-tabs>

Once you have a refundable swap in hand, use the following code to execute a refund:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/receive_onchain.rs:execute-refund}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ReceiveOnchain.swift:execute-refund}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ReceiveOnchain.kt:execute-refund}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/receive_onchain.ts:execute-refund}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/receive_onchain.dart:execute-refund}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/receive_onchain.py:execute-refund}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/receive_onchain.go:execute-refund}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ReceiveOnchain.cs:execute-refund}}
```
</section>
</custom-tabs>

<div class="warning">
<h4>Developer note</h4>

A refund can be attempted several times. A common scenario where this is useful is if the initial refund transaction takes too long to mine, your application's users can be offered the ability to re-trigger the refund with a higher feerate.

</div>

# Calculating fees

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

# SwapInfo fields

When using these methods you are getting a SwapInfo object in return where some fields are dynamic and some static immutable data. Here is an overview of what the fields represent

### Static data
- **bitcoin_address**: Single-use bitcoin address created by *script*.
- **created_at**: Relative time lock start, set to 0.
- **lock_height**: Relative time lock for the timeout in order for the script to be redeemed if swap fails. 
- **payment_hash**:(Binary) 256 hash of preimage to used in the claim sript.
- **preimage**:(Binary) Secret to claim the swap.
- **private_key**:(Binary) Secret claim key for the bitcoin address
- **public_key**:(Binary) Public key in binary format of the private claim private key.
- **swapper_public_key**:(Binary) the public key in binary format from the swapping service.
- **script**:(Binary) lockingsscript for the generated bitcoin address.

### Dynamic data
- **bolt11** (Optional): bolt11 invoice to claim the sent funds.
- **paid_sats**: Amount of sats payed to the claim address
- **confirmed_sats**: Confirmed onchain sats to be claim with an bolt11 invoice or refunded if swap fails.
- **unconfirmed_sats**: Unconfirmed sats waiting to be confirmed onchain.
- **status** (SwapStatus): Shows the current status of the swap, either `Initial` or `Expired`.
refund_tx_ids: Transaction ID for failed swap attempts.
- **refund_tx_ids**: Transaction ID for failed swaps attemps.
- **unconfirmed_tx_ids**: Transaction ID for ongoing swap awaiting confirmation.
- **confirmed_tx_ids**: Transaction ID that have been confirmed on-chain.
- **min_allowed_deposit**: The minimum amount the one can send in order for the swap to succeed.
- **max_allowed_deposit**:  The maximum amount the one can send in order for the swap to succeed.
- **last_redeem_error** (Optional): Error reason for when swap fails.
- **channel_opening_fees** (Optional): Fees for opening new channel if needed. [^1]


[^1]: For more details on these fees, see [Channel Opening Fees](connecting_lsp.md#channel-opening-fees)
