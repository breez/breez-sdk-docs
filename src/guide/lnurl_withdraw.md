# LNURL-Withdraw


## Usage

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,no_run
// Endpoint can also be of the form:
// lnurlw://domain.com/lnurl-withdraw?key=val
let lnurl_withdraw_url = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk";

if let Ok(LnUrlWithdraw{data: wd}) = parse(lnurl_withdraw_url).await {
    // TODO Determine withdraw amount
    let amount_msat = wd.min_withdrawable;
    let description = "Test withdraw".to_string();
    
    sdk.lnurl_withdraw(wd, amount_msat, Some(description)).await?;
}
```
</section>
<div slot="title">Swift</div>
<section>

```swift
// Endpoint can also be of the form:
// lnurlw://domain.com/lnurl-withdraw?key=val
let lnurlWithdrawUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk"

do {
  let inputType = try parseInput(s: lnurlWithdrawUrl)
  if case .lnUrlWithdraw(let data) = inputType {
    let amountSat = data.minWithdrawable
    let description = "Test withdraw"
    try sdk.withdrawLnurl(reqData: data, amountSats: amountSat, description: "comment")
  }
} catch {
    // handle error
}

```
</section>
<div slot="title">React Native</div>
<section>

```typescript
// Endpoint can also be of the form:
// lnurlw://domain.com/lnurl-withdraw?key=val
let lnurlWithdrawUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk";

try {
    const input = await parseInput(lnurlWithdrawUrl)
    if (input.type === InputType.LNURL_WITHDRAW) {
        const amountSats = input.data.minWithdrawable;
        const result = await withdrawLnurl(input.data, amountSats, "comment")
    }    
} catch (error) {
    console.log(error)
}
```
</section>
<div slot="title">Dart</div>
<section>

```dart
// Endpoint can also be of the form:
// lnurlw://domain.com/lnurl-withdraw?key=val
String lnurlWithdrawUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk";

try {
    InputType inputType = await parseInput(s: lnurlWithdrawUrl);
    if (inputType is InputType_LnUrlWithdraw) {
        int amountSats = inputType.data.minWithdrawable;
        LnUrlCallbackStatus result = await lnurlWithdraw(
            reqData: inputType.data,
            amountSats: amountSats,
            description: "comment",
        );
    }
} catch (error) {
    // handle error
}
```
</section>
<div slot="title">Python</div>
<section>

```python
# Endpoint can also be of the form:
# lnurlw://domain.com/lnurl-withdraw?key=val
lnurl_withdraw_url = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk"

try:
  parsed_input = parse_input(lnurl_withdraw_url)
  if isinstance(parsed_input, breez_sdk.InputType.LN_URL_WITHDRAW):
    amount_sats = parsed_input.data.min_withdrawable
    result = sdk_services.withdraw_lnurl(parsed_input.data, amount_sats, "comment")
except Exception as error:
      # Handle error
```
</section>
<div slot="title">Go</div>
<section>

```go
// Endpoint can also be of the form:
// lnurlw://domain.com/lnurl-withdraw?key=val
lnurlWithdrawUrl := "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk"

if input, err := breez_sdk.ParseInput(lnurlWithdrawUrl); err != nil {
    switch inputType := input.(type) {
    case breez_sdk.InputTypeLnUrlWithdraw:
        amountsSats := inputType.Data.MinWithdrawable
        description := "comment"
        result, err := sdkServices.WithdrawLnurl(inputType.Data, amountsSats, &description)
    }
}
```
</section>
</custom-tab>

## Supported Specs

- [LUD-01](https://github.com/lnurl/luds/blob/luds/01.md) LNURL bech32 encoding
- [LUD-03](https://github.com/lnurl/luds/blob/luds/03.md) `withdrawRequest` spec
- [LUD-17](https://github.com/lnurl/luds/blob/luds/17.md) Support for lnurlw prefix with non-bech32-encoded LNURL URLs
