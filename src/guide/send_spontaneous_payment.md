# Sending spontaneous Lightning payments

They can even be spontaneous payments to a node without a bolt11 invoice.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_spontaneous_payment.rs:send-spontaneous-payment}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendSpontaneous.swift:send-spontaneous-payment}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendSpontaneousPayment.kt:send-spontaneous-payment}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_spontaneous_payment.ts:send-spontaneous-payment}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_spontaneous_payment.dart:send-spontaneous-payment}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/send_spontaneous_payment.py:send-spontaneous-payment}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_spontaneous_payment.go:send-spontaneous-payment}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendSpontaneousPayment.cs:send-spontaneous-payment}}
```
</section>
</custom-tabs>

## Adding Extra TLVs to a Spontaneous Payment

A list of extra TLV data can also be sent with the sponaneous payment.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/send_spontaneous_payment.rs:send-spontaneous-payment-with-tlvs}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/SendSpontaneous.swift:send-spontaneous-payment-with-tlvs}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/SendSpontaneousPayment.kt:send-spontaneous-payment-with-tlvs}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/send_spontaneous_payment.ts:send-spontaneous-payment-with-tlvs}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/send_spontaneous_payment.dart:send-spontaneous-payment-with-tlvs}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/send_spontaneous_payment.py:send-spontaneous-payment-with-tlvs}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/send_spontaneous_payment.go:send-spontaneous-payment-with-tlvs}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/SendSpontaneousPayment.cs:send-spontaneous-payment-with-tlvs}}
```
</section>
</custom-tabs>
