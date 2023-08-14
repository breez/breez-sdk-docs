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