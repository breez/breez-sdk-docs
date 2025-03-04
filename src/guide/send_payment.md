<h1 id="sending-lightning-payments">
    <a class="header" href="#sending-lightning-payments">Sending Lightning payments</a>
    <a class="tag" target="_blank" href="https://breez.github.io/breez-sdk-greenlight/breez_sdk_core/struct.BreezServices.html#method.send_payment">API docs</a>
</h1>

Once you have outbound liquidity you can start sending payments too.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_payment.rs:send-payment}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendPayment.swift:send-payment}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendPayment.kt:send-payment}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_payment.ts:send-payment}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_payment.dart:send-payment}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/send_payment.py:send-payment}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_payment.go:send-payment}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendPayment.cs:send-payment}}
```
</section>
</custom-tabs>

## Trampoline payments

In the above example, the `use_trampoline` flag is set to `true` to enable
trampoline payments. With trampoline, pathfinding through the lightning network
is outsourced to the LSP. 

This has several benefits:
- The payment is more reliable and faster as the LSP has a better view of the
  network topology and can find good routes faster.
- There is less interaction between the user's app and the user's node in the
  cloud, improving payment speed.
- Fees for lightning payments are fixed. That means fees can be displayed to the
  user before paying. 

The trade-offs are:
- The payment is less private as the LSP will learn the payment destination.

To disable trampoline payments, set `use_trampoline` to `false`. The user's node
will then attempt to find routes directly, without outsourcing pathfinding to
the LSP.