# Connecting to an LSP

Based on the API key provided to the Breez SDK, a default LSP is selected for your node to provide liquidity to it. To get the information about the selected LSP you can do the following:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/connecting_lsp.rs:get-lsp-info}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
do {
    let lspId = try sdk.lspId() 
    let lspInfo = try sdk.lspInfo()
} catch {
    // Handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
try {
    val lspId = sdk.lspId()
    if (lspId != null) {
        val lspInfo = sdk.lspInfo()
    } else {
        // Handle no lsp id scenario
    }
} catch (e: Exception) {
    // Handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/connecting_lsp.ts:get-lsp-info}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/connecting_lsp.dart:get-lsp-info}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python_snippets/src/connecting_lsp.py:get-lsp-info}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/connecting_lsp.go:get-lsp-info}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ConnectingLsp.cs:get-lsp-info}}
```
</section>
</custom-tabs>

When you have selected an LSP you may then connect to it.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/connecting_lsp.rs:connect-lsp}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
do {
    try sdk.connectLsp(lspId: lspId!)
} catch {
    // Handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
try {
    sdk.connectLsp(lspId)
} catch (e: Exception) {
    // Handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/connecting_lsp.ts:connect-lsp}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/connecting_lsp.dart:connect-lsp}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python_snippets/src/connecting_lsp.py:connect-lsp}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/connecting_lsp.go:connect-lsp}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ConnectingLsp.cs:connect-lsp}}
```
</section>
</custom-tabs>


## Channel Opening Fees

Some Breez SDK operations[^1] may need opening a new channel with the LSP. The SDK supports the LSP2 dynamic fees spec[^2],
which describes how these channel opening fees are handled.

For the client, the key points are:

* The `LspInformation` can be fetched at any point and includes a list of channel opening fees and the duration for which
  they are valid. The fees are sorted from cheapest to most expensive. The higher fees are typically also valid for longer.
* Depending on the application and use-case, the client may choose an appropriate fee and give it as an argument in the
  relevant Breez SDK method. If this fee argument is not provided, Breez SDK will choose an appropriate one instead.

The channel opening fees are provided in a structure[^3] that includes the conditions associated with these fees, like
the minimum invoice amount or the date and time until when this opening fee is valid.

---

[^1]: See the service methods `receive_payment`, `receive_onchain` or `buy_bitcoin`.

[^2]: [https://github.com/BitcoinAndLightningLayerSpecs/lsp/tree/main/LSPS2]()

[^3]: [https://breez.github.io/breez-sdk/breez_sdk_core/struct.OpeningFeeParams.html]()