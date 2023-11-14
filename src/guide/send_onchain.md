# Sending an on-chain transaction (swap-out)

You can send funds from the Breez SDK wallet to an on-chain address as follows.

First, fetch the current reverse swap fees:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_onchain.rs:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendOnchain.swift:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendOnchain.kt:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_onchain.ts:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/send_onchain.py:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_onchain.go:estimate-current-reverse-swap-total-fees}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:estimate-current-reverse-swap-total-fees}}
```
</section>
</custom-tabs>

The reverse swap will involve two on-chain transactions, for which the mining fees can only be estimated. They will happen
automatically once the process is started, but the last two values above are these estimates to help you get a picture
of the total costs.

Fetching the fees also tells you what is the range of amounts you can send:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_onchain.rs:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendOnchain.swift:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendOnchain.kt:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_onchain.ts:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/send_onchain.py:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_onchain.go:get-current-reverse-swap-min-max}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:get-current-reverse-swap-min-max}}
```
</section>
</custom-tabs>

Once you checked the fees are acceptable, you can start the reverse swap:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_onchain.rs:start-reverse-swap}}
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
{{#include ../../snippets/react-native/send_onchain.ts:start-reverse-swap}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:start-reverse-swap}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/send_onchain.py:start-reverse-swap}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_onchain.go:start-reverse-swap}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendOnchain.cs:start-reverse-swap}}
```
</section>
</custom-tabs>

Starting the reverse swap will trigger a HODL invoice payment, which will only be settled if the entire swap completes.
This means you will see an outgoing pending payment in your list of payments, which locks those funds until the invoice
is either settled or cancelled. This will happen automatically at the end of the reverse swap.

You can check its status with:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_onchain.rs:check-reverse-swaps-status}}
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
{{#include ../../snippets/react-native/send_onchain.ts:check-reverse-swaps-status}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_onchain.dart:check-reverse-swaps-status}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/send_onchain.py:check-reverse-swaps-status}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_onchain.go:check-reverse-swaps-status}}
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