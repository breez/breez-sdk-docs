# Communicating fees

In the LSP model, fees are involved when the user wants to receive a payment, but doesn't have a sufficient receivable amount. This section provides recommendations on how to communicate these fees to a user.

<h2 id="before-receiving-a-lightning-payment">
    <a class="header" href="#before-receiving-a-lightning-payment">Before receiving a Lightning payment</a>
    <a class="tag" target="_blank" href="https://breez.github.io/breez-sdk-greenlight/breez_sdk_core/struct.BreezServices.html#method.open_channel_fee">API docs</a>
</h2>

When the user wants to receive a payment, a setup fee is paid when the resulting invoice would exceed the receivable amount.
The setup fee is made up of two parts:
- A minimum fee
- A proportional fee based on the amount

Before creating an invoice, the amount the user will want to receive is yet unknown. It is recommended to show the user a message consisting of the following information:

> A setup fee of x% with a minimum of y sats will be applied for receiving more than z sats.

You can construct this message as follows:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/communicating_fees.rs:get-fee-info-before-receiving-payment}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/CommunicatingFees.swift:get-fee-info-before-receiving-payment}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/CommunicatingFees.kt:get-fee-info-before-receiving-payment}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/communicating_fees.ts:get-fee-info-before-receiving-payment}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/communicating_fees.dart:get-fee-info-before-receiving-payment}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/communicating_fees.py:get-fee-info-before-receiving-payment}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/communicating_fees.go:get-fee-info-before-receiving-payment}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/CommunicatingFees.cs:get-fee-info-before-receiving-payment}}
```
</section>
</custom-tabs>

## After creating an invoice
After calling `receive_payment`, you would typically show the recipient a screen containing a QR code with the invoice that the sender can scan.

This is another place to show the user the opening fees applied to the invoice. At this point the amount the user wants to receive is known, so the message can be more concise:

> A setup fee of x sats is applied to this invoice.

The fiat amount can also be included. In case of a mobile app it is recommended to communicate to the user that the app has to be run in the foreground in order to be able to receive the payment.
<div class="warning">
<h4>Developer note</h4>
Consider implementing the <a href="/notifications/getting_started.md">Notification Plugin</a> when using the Breez SDK in a mobile application. By registering a webhook the application can receive a payment notification to process the payment in the background.
</div>

Here is how you can build this message:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/communicating_fees.rs:get-fee-info-after-invoice-created}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/CommunicatingFees.swift:get-fee-info-after-invoice-created}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/CommunicatingFees.kt:get-fee-info-after-invoice-created}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/communicating_fees.ts:get-fee-info-after-invoice-created}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/communicating_fees.dart:get-fee-info-after-invoice-created}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/communicating_fees.py:get-fee-info-after-invoice-created}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/communicating_fees.go:get-fee-info-after-invoice-created}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/CommunicatingFees.cs:get-fee-info-after-invoice-created}}
```
</section>
</custom-tabs>

## Sending a Lightning payment
Routing fees for sending Lightning payments vary based on the available path, as some channels incur higher fees due to the distribution of liquidity across the network. Developers have the option to set limits on Lightning fees, which are capped by default at 1% of the payment amount. However, it's important to note that restricting fees can increase the likelihood of payment failures.

For users leveraging trampoline payments (recommended for reliabily), routing fees are currently fixed at 0.5% + 4 sat.

<h2 id="receiving-an-on-chain-transaction">
    <a class="header" href="#receiving-an-on-chain-transaction">Receiving an on-chain transaction</a>
    <a class="tag" target="_blank" href="https://breez.github.io/breez-sdk-greenlight/breez_sdk_core/struct.BreezServices.html#method.receive_onchain">API docs</a>
</h2>

For receiving onchain, there is a minimum and a maximum amount the user can receive. The fees are made up of the same components as receiving a lightning payment.

The user gets an onchain address from `receive_onchain`. There is no way to know ahead of time exactly the amount that will be received on this address, so it is recommended to show the user the receivable boundaries and the fees involved:

> Send more than v sats and up to w sats to this address. A setup fee of x% with a minimum of y sats will be applied for sending more than z sats. This address can only be used once.

Below code sample constructs this message.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/communicating_fees.rs:get-fee-info-receive-onchain}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/CommunicatingFees.swift:get-fee-info-receive-onchain}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/CommunicatingFees.kt:get-fee-info-receive-onchain}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/communicating_fees.ts:get-fee-info-receive-onchain}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/communicating_fees.dart:get-fee-info-receive-onchain}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/communicating_fees.py:get-fee-info-receive-onchain}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/communicating_fees.go:get-fee-info-receive-onchain}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/CommunicatingFees.cs:get-fee-info-receive-onchain}}
```
</section>
</custom-tabs>

## Sending an on-chain transaction
Sending an on-chain transaction to a BTC address involves a trustless [reverse swap](https://medium.com/breez-technology/reverse-submarine-swaps-another-step-towards-a-p2p-lightning-economy-bacb040fdca7). Reverse swaps have a minimum transaction amount of 50,000 sats, which may increase during periods of high fees. The reverse swap provider, [Boltz](https://boltz.exchange/), charges a fixed service fee of 0.5% plus an additional mining fee based on current Bitcoin mempool usage.

Follow the instructions [here](./pay_onchain.html) to calculate limits and fees.
