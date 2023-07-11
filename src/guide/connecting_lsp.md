# Connecting to an LSP

In order to list all available lsp you may connect to you may do the following.

<custom-tabs category="lang">
<div slot="title">python</div>
<section>

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