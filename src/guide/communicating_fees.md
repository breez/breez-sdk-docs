# Communicating fees

In the LSP model, fees are involved when the user wants to receive a payment, but doesn't have a sufficient receivable amount. This section provides recommendations on how to communicate these fees to a user.

### Before receiving a payment
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

### When an invoice is created
After calling `receive_payment`, you would typically show the recipient a screen containing a QR code with the invoice that the sender can scan.

This is another place to show the user the opening fees applied to the invoice. At this point the amount the user wants to receive is known, so the message can be more concise:

> A setup fee of x sats is applied to this invoice.

The fiat amount can be included. In case of a mobile app it is recommended to communicate to the user that the app has to be run in the foreground in order to be able to receive the payment.

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


### Receive onchain
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