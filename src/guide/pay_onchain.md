# Sending an on-chain transaction (Swap-Out)

You can send funds from the Breez SDK wallet to an on-chain address as follows.

## Checking the limits
First, fetch the current reverse swap limits:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/pay_onchain.rs:get-current-reverse-swap-limits}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendOnchain.swift:get-current-reverse-swap-limits}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendOnchain.kt:get-current-reverse-swap-limits}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/pay_onchain.ts:get-current-reverse-swap-limits}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/pay_onchain.dart:get-current-reverse-swap-limits}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/pay_onchain.py:get-current-reverse-swap-limits}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/pay_onchain.go:get-current-reverse-swap-limits}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:get-current-reverse-swap-limits}}
```
</section>
</custom-tabs>

This represents the range of valid amounts that can be sent at this point in time. The range may change depending on the wallet's liquidity, swap service parameters or mempool feerate fluctuations.

<div class="warning">
<h4>Developer note</h4>


It is best to fetch these limits just before your app shows the Pay Onchain (reverse swap) UI. You can then use these limits to validate the user input.

</div>

## Preparing to send, checking fees
The next step is to get an overview of the exact amount that will be sent, the amount that will be received, and the fees.

There are two ways to do this:
- you can set the sender amount, then the recipient amount will be your input minus the fees
- you can set the recipient amount, in which case the sender amount will be your input plus the fees

Assuming you'd like to specify the sender amount, the snippet is as follows:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/pay_onchain.rs:prepare-pay-onchain}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendOnchain.swift:prepare-pay-onchain}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendOnchain.kt:prepare-pay-onchain}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/pay_onchain.ts:prepare-pay-onchain}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/pay_onchain.dart:prepare-pay-onchain}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/pay_onchain.py:prepare-pay-onchain}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/pay_onchain.go:prepare-pay-onchain}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:prepare-pay-onchain}}
```
</section>
</custom-tabs>

If instead you'd like to specify the recipient amount, simply change the `SwapAmountType` from `Send` to `Receive`.

In case you want to drain your channels and send the maximum amount possible, you can use the above snippet with `amount_sat` set to `current_limits.max_sat` and `amount_type` as `Send`.


## Executing the Swap

Once you checked the amounts and the fees are acceptable, you can continue with sending the payment.

Note that one of the arguments will be the result from the `prepare` call above.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/pay_onchain.rs:start-reverse-swap}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendOnchain.swift:start-reverse-swap}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendOnchain.kt:start-reverse-swap}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/pay_onchain.ts:start-reverse-swap}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/pay_onchain.dart:start-reverse-swap}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/pay_onchain.py:start-reverse-swap}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/pay_onchain.go:start-reverse-swap}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:start-reverse-swap}}
```
</section>
</custom-tabs>

Starting the onchain payment (reverse swap) will trigger a HODL invoice payment, which will only be settled if the entire swap completes.
This means you will see an outgoing pending payment in your list of payments, which locks those funds until the invoice
is either settled or cancelled. This will happen automatically at the end of the reverse swap.

## List in-progress Swaps

You can check the ongoing onchain payments (reverse swaps) and their status with:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/pay_onchain.rs:check-reverse-swaps-status}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendOnchain.swift:check-reverse-swaps-status}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendOnchain.kt:check-reverse-swaps-status}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/pay_onchain.ts:check-reverse-swaps-status}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/pay_onchain.dart:check-reverse-swaps-status}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/pay_onchain.py:check-reverse-swaps-status}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/pay_onchain.go:check-reverse-swaps-status}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:check-reverse-swaps-status}}
```
</section>
</custom-tabs>

If the reverse swap is successful, you'll get the on-chain payment on your destination address and the HODL invoice will
change from pending to settled.

If however something goes wrong at any point in the process, the initial HODL payment will be cancelled and the funds in
your Breez SDK wallet will be unlocked.
