# LNURL-Withdraw


## Usage

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
// Endpoint can also be of the form:
// lnurlw://domain.com/lnurl-withdraw?key=val
let lnurl_withdraw_url = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk";

if let Ok(LnUrlWithdraw{data: wd}) = parse(lnurl_withdraw_url).await {
    let amount_msat = wd.min_withdrawable;
    let description = "Test withdraw".to_string();
    
    sdk.lnurl_withdraw(LnUrlWithdrawRequest{
        data: wd,
        amount_msat,
        description: Some(description)
    }).await?;
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
    let amountMsat = data.minWithdrawable
    let description = "Test withdraw"
    req: ListPaymentsRequest(filter: PaymentTypeFilter.all)
    try sdk.withdrawLnurl(req: LnUrlWithdrawRequest(
        data: data,
        amountMsat: amountMsat,
        description: "comment"))
  }
} catch {
  // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
// Endpoint can also be of the form:
// lnurlw://domain.com/lnurl-withdraw?key=val
// lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7…
val lnurlWithdrawUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7…"
try {
    val inputType = parseInput(lnurlPayUrl)
    if (inputType is InputType.LnUrlWithdraw) {
        val requestData = inputType.data
        val amountMsat = requestData.minWithdrawable
        val comment = "Any comment"
        sdk.withdrawLnurl(LnUrlWithdrawRequest(requestData, amountMsat, comment)
    }
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
// Endpoint can also be of the form:
// lnurlw://domain.com/lnurl-withdraw?key=val
let lnurlWithdrawUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk"

try {
    const input = await parseInput(lnurlWithdrawUrl)
    if (input.type === InputTypeVariant.LN_URL_WITHDRAW) {
        const amountMsat = input.data.minWithdrawable
        const result = await withdrawLnurl({data: input.data, amountMsat, description: "comment"})
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
        int amountMsat = inputType.data.minWithdrawable;
        LnUrlCallbackStatus result = await lnurlWithdraw(
            req: LnUrlWithdrawRequest(
                data: inputType.data,
                amountMsat: amountMsat,
                description: "comment",
            ),
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
  parsed_input = breez_sdk.parse_input(lnurl_withdraw_url)
  if isinstance(parsed_input, breez_sdk.InputType.LN_URL_WITHDRAW):
    amount_msat = parsed_input.data.min_withdrawable
    result = sdk_services.withdraw_lnurl(breez_sdk.LnUrlWithdrawRequest(data=parsed_input.data, amount_msat=amount_msat, description="comment"))
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
        amountMsat := inputType.Data.MinWithdrawable
        description := "comment"
        if result, err := sdk.WithdrawLnurl(breez_sdk.LnUrlWithdrawRequest{
            Data: inputType.Data, 
            AmountMsat: amountMsat, 
            Description: &description,
        }); err != nil {
            switch result.(type) {
            case breez_sdk.LnUrlCallbackStatusOk:
                log.Printf("Successfully withdrawn")
            default:
                log.Printf("Failed to withdraw")
            }
        }
    }
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
// Endpoint can also be of the form:
// lnurlw://domain.com/lnurl-withdraw?key=val
var lnurlWithdrawUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk";

try 
{
    var input = BreezSdkMethods.ParseInput(lnurlWithdrawUrl);
    if (input is InputType.LnUrlWithdraw lnurlw) 
    {
        var amountMsat = lnurlw.data.minWithdrawable;
        var result = sdk.WithdrawLnurl(
            new LnUrlWithdrawRequest(
                lnurlw.data, 
                amountMsat, 
                "comment"));
    }
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>

## Supported Specs

- [LUD-01](https://github.com/lnurl/luds/blob/luds/01.md) LNURL bech32 encoding
- [LUD-03](https://github.com/lnurl/luds/blob/luds/03.md) `withdrawRequest` spec
- [LUD-17](https://github.com/lnurl/luds/blob/luds/17.md) Support for lnurlw prefix with non-bech32-encoded LNURL URLs
