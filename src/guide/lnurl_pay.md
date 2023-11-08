# LNURL-Pay

## Usage

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/lnurl_pay.rs:lnurl-pay}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
// Endpoint can also be of the form:
// lnurlp://domain.com/lnurl-pay?key=val
// lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
let lnurlPayUrl = "lightning@address.com";
do {
    let inputType = try parseInput(s: lnurlPayUrl)
    if case .lnUrlPay(let data) = inputType {
        let amountMsat = data.minSendable;
        try sdk.payLnurl(req: LnUrlPayRequest(
            data: data, 
            amountMsat: amountMsat, 
            comment: "comment"))
    }
} catch {
    // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
// Endpoint can also be of the form:
// lnurlp://domain.com/lnurl-pay?key=val
// lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
val lnurlPayUrl = "lightning@address.com";
try {
    val inputType = parseInput(lnurlPayUrl)
    if (inputType is InputType.LnUrlPay) {
        val requestData = inputType.data
        val amountMsat = requestData.minSendable
        sdk.payLnurl(LnUrlPayRequest(requestData, amountMsat, "comment"))
    }
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/lnurl_pay.ts:lnurl-pay}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/lnurl_pay.dart:lnurl-pay}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
# Endpoint can also be of the form:
# lnurlp://domain.com/lnurl-pay?key=val
# lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
lnurl_pay_url = "lightning@address.com"

try: 
    parsed_input = breez_sdk.parse_input(lnurl_pay_url)
    if isinstance(parsed_input, breez_sdk.InputType.LN_URL_PAY):
        amount_msat = parsed_input.data.min_sendable
        result = sdk_service.pay_lnurl(
            breez_sdk.LnUrlPayRequest(
                data=parsed_input.data, 
                amount_msat=amount_msat, 
                comment="comment"))
except Exception as error:
      # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/lnurl_pay.go:lnurl-pay}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/LnurlPay.cs:lnurl-pay}}
```
</section>
</custom-tabs>

## Supported Specs
- [LUD-01](https://github.com/lnurl/luds/blob/luds/01.md) LNURL bech32 encoding
- [LUD-06](https://github.com/lnurl/luds/blob/luds/06.md) `payRequest` spec
- [LUD-16](https://github.com/lnurl/luds/blob/luds/16.md) LN Address
- [LUD-17](https://github.com/lnurl/luds/blob/luds/17.md) Support for lnurlp prefix with non-bech32-encoded LNURL URLs
