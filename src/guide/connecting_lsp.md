# Connecting to an LSP

<custom-tabs category="lang">
<div slot="title">Swift</div>
<section>
Based on the API key provided to the Breez SDK, a default LSP is selected for your node to provide liquidity to it. To get the information about the selected LSP you can do the following:

```swift
do {
    let lspId = let lspId = try sdk.lspId() 
    let lspInfo = try sdk.fetchLspInfo(lspId: lspID!)
} catch {
    // Handle error
}
```

When you have selected an LSP you may then connect to it.

```swift
do {
    try sdk.connectLsp(lspId: lspID!)
} catch {
    // Handle error
}
```

</section>

<div slot="title">Dart</div>
<section>

Based on the API key provided to the Breez SDK, a default LSP is selected for your node to provide liquidity to it. To get the information about the selected LSP you can do the following:

```dart
try {
    List<LspInformation> lspList = await listLsps();
    // Select your desired LSP 
} catch (e) {
    // Handle error
}
```

When you have selected an LSP you may then connect to it.

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

Based on the API key provided to the Breez SDK, a default LSP is selected for your node to provide liquidity to it. To get the information about the selected LSP you can do the following:

```python 
try: 
    lsp_id = sdk_services.lsp_id()
    lsp_info = sdk_services.fetch_lsp_info(lsp_id)
   
except Exception as error:
    # Handle error
```

When you have selected an LSP you may then connect to it.

```python
try: 
    sdk_services.connect_lsp(lsp_id)
except Exception as error:
    # Handle error
```

</section>
<div slot="title">Go</div>
<section>

Based on the API key provided to the Breez SDK, a default LSP is selected for your node to provide liquidity to it. To get the information about the selected LSP you can do the following:


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

 When you have selected an LSP you may then connect to it.

 ```go
err = sdkServices.ConnectLsp(*lspId)
if err != nil {
    // Handle error
}
 
 ```

</custom-tabs>