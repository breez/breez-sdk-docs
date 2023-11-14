# Receiving Lightning Payments

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
