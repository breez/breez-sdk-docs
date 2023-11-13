# LNURL-Withdraw


## Usage

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/lnurl_withdraw.rs:lnurl-withdraw}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
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

<div slot="title">Kotlin</div>
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
{{#include ../../snippets/react-native/lnurl_withdraw.ts:lnurl-withdraw}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/lnurl_withdraw.dart:lnurl-withdraw}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python_snippets/src/lnurl_withdraw.py:lnurl-withdraw}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/lnurl_withdraw.go:lnurl-withdraw}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/LnurlWithdraw.cs:lnurl-withdraw}}
```
</section>
</custom-tabs>

## Supported Specs

- [LUD-01](https://github.com/lnurl/luds/blob/luds/01.md) LNURL bech32 encoding
- [LUD-03](https://github.com/lnurl/luds/blob/luds/03.md) `withdrawRequest` spec
- [LUD-17](https://github.com/lnurl/luds/blob/luds/17.md) Support for lnurlw prefix with non-bech32-encoded LNURL URLs
