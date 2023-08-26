# Connecting to an LSP

Based on the API key provided to the Breez SDK, a default LSP is selected for your node to provide liquidity to it. To get the information about the selected LSP you can do the following:

<custom-tabs category="lang">
<div slot="title">Swift</div>
<section>

```swift
do {
    let lspId = try sdk.lspId() 
    let lspInfo = try sdk.fetchLspInfo(lspId: lspId!)
} catch {
    // Handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
try {
    val lspId = sdk.lspId()
    if (lspId != null) {
        val lspInfo = sdk.fetchLspInfo(lspId)
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
try {
    const lspId = await lspId() 
    const lspInfo = await fetchLspInfo(lspId)
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    List<LspInformation> lspList = await listLsps();
    // Select your desired LSP 
} catch (e) {
    // Handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python 
try: 
    lsp_id = sdk_services.lsp_id()
    lsp_info = sdk_services.fetch_lsp_info(lsp_id)
   
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
lspId, err := sdkServices.LspId()
if err != nil {
    // Handle error
}
lspInfo, err := sdkServices.FetchLspInfo(*lspId)
if err != nil {
    // Handle error
}
 ```
</section>

<div slot="title">C#</div>
<section>

```cs
try 
{
    var lspId = sdk.LspId();
    var lspInfo = sdk.FetchLspInfo(lspId!);
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>

When you have selected an LSP you may then connect to it.

<custom-tabs category="lang">
<div slot="title">Swift</div>
<section>

```swift
do {
    try sdk.connectLsp(lspId: lspId!)
} catch {
    // Handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
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
try {
    await connectLsp(lspId)
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    String lspId = await lspId();
    await connectLSP(lspId);
} catch (e) {
    // Handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
try: 
    sdk_services.connect_lsp(lsp_id)
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

 ```go
err = sdkServices.ConnectLsp(*lspId)
if err != nil {
    // Handle error
}
 ```
</section>

<div slot="title">C#</div>
<section>

```cs
try 
{
    sdk.ConnectLsp(lspId!);
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>


## Channel Opening Fees

Some Breez SDK operations[^1] may need opening a new channel with the LSP. The SDK supports the LSP2 dynamic fees spec[^2],
which describes how these channel opening fees are handled.

For the client, the key points are:

* The `LsInformation` can be fetched at any point and includes a list of channel opening fees and the duration for which
  they are valid. The fees are sorted from cheapest to most expensive. The higher fees are typically also valid for longer.
* Depending on the application and use-case, the client may choose an appropriate fee and give it as an argument in the
  relevant Breez SDK method. If this fee argument is not provided, Breez SDK will choose an appropriate one instead.

The channel opening fees are provided in a structure[^3] that includes the conditions associated with these fees, like
the minimum invoice amount or the date and time until when this opening fee is valid.

---

[^1]: See the service methods `receive_payment`, `receive_onchain` or `buy_bitcoin`.

[^2]: [https://github.com/BitcoinAndLightningLayerSpecs/lsp/tree/main/LSPS2]()

[^3]: [https://breez.github.io/breez-sdk/breez_sdk_core/struct.OpeningFeeParams.html]()