# Moving to production 

To move your project to production, you will have to replace the evaluation invite code with a partner certificate issued by Greenlight.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/production.rs:moving-to-production}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/Production.swift:moving-to-production}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/Production.kt:moving-to-production}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/production.ts:moving-to-production}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/production.dart:moving-to-production}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/production.py:moving-to-production}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/production.go:moving-to-production}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/Production.cs:moving-to-production}}
```
</section>
</custom-tabs>

To obtain a certificate for a production environment, please register [here](https://greenlight.blockstream.com/) and make sure to notify your LSP(s).

## Applying certificates

The certificates received from Blockstream should be contained with a zip file. Within the zip file should be a `.crt` and a `.pem` file, these are the certificate and private key files. To use these files with the Breez SDK each file needs to be read as binary/byte data, inserting the `.crt` data as the developer cert and the `.pem` data as the developer key.
<div class="warning">
<h4>Developer note</h4>
Leave the file contents as is, manipulating the file contents will result in transport errors. 
<ul>
<li><b>Do not</b> strip the headers and footers from the file contents<br/>(<code>BEGIN CERTIFICATE</code> / <code>END CERTIFICATE</code> / <code>BEGIN PRIVATE KEY</code> / <code>END PRIVATE KEY</code>)</li>
<li><b>Do not</b> use only part of the certificate</li>
</ul>
</div>

## Production checklist
There are some use cases where you need to verify that they are implemented correctly. Here is a checklist you can use to verify that your application is production ready.

- **Add logging**: Add sufficient logging into your application to diagnose any issues users are having. For more information: [Adding logging](logging.md).

- **Handle closed channels**: Make sure you allow your users to redeem their onchain balance in case their channels were closed. For more information: [Handling channel closures](closed_channels.md).

- **Display pending payments**: Payments always contain a status field that can be used to determine if the payment was completed or not. Make sure you handle the case where the payment is still pending by showing the correct status to the user.

- **Enable swaps refunds**: Swaps that are the result of [Receiving an On-Chain Transaction](receive_onchain.md) may not be completed and change to `Refundable` state. Make sure you handle this case correctly by allowing the user to retry the [refund](receive_onchain.html#refund-a-swap) with different fees as long as the refund is not confirmed. A confirmed refund changes the swap status from `Refundable` to `Completed`.

- **Expose swap fees**: When sending or receiving on-chain, make sure to clearly show the expected fees involved, as well as the send / receive amounts.

- **Connect on-demand**: Create a Lightning node (connect) only when users are interested to receive payments with Lightning (not on the app startup).
