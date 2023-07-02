# LNURL-Pay

## Usage

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,no_run
// Endpoint can also be of the form:
// lnurlp://domain.com/lnurl-pay?key=val
// lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
let lnurl_pay_url = "lightning@address.com";

if let Ok(LnUrlPay{data: pd}) = parse(lnurl_pay_url).await {
    // TODO Show payment details in UI, read user input
    let amount_msat = pd.min_sendable;
    let comment = "Test payment".to_string();
    
    sdk.lnurl_pay(amount_msat, Some(comment), pd).await?;
}
```

</section>
<div slot="title">Swift</div>
<section>

```swift
// Endpoint can also be of the form:
// lnurlp://domain.com/lnurl-pay?key=val
// lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
let lnurlPayUrl = "lightning@address.com";
do {
  let inputType = try parseInput(s: input)
  if case .lnUrlPay(data) = inputType {
    let amountSats = inputType.minSendable;
    try sdk.payLnurl(amountSats: amountSats, "comment", reqData: data)
  }
} catch SdkError.Error(let message) {
  print(message)
}
```
</section>
</custom-tab>

## Supported Specs

- [LUD-01](https://github.com/lnurl/luds/blob/luds/01.md) LNURL bech32 encoding
- [LUD-06](https://github.com/lnurl/luds/blob/luds/06.md) `payRequest` spec
- [LUD-16](https://github.com/lnurl/luds/blob/luds/16.md) LN Address
- [LUD-17](https://github.com/lnurl/luds/blob/luds/17.md) Support for lnurlp prefix with non-bech32-encoded LNURL URLs
