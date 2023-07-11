# Connecting to an LSP

<custom-tabs category="lang">
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
<div slot="title">python</div>
<section>

Based on the API key provided to the Breez SDK, a default LSP is selected for your node to provide liquidity to it. To get the information about the selected LSP you can do the following:

```python 
try: 
    lsps = sdk_services.list_lsps()
    # Select your desired LSP 
   
except Exception as error:
    # Handle error
```

When you have selected an LSP you may then connect to it.

```python
try: 
    lsp_id = sdk_services.lsp_id()
    sdk_services.connect_lsp(lsp_id)
except Exception as error:
    # Handle error
```

</section>
</custom-tabs>