# LNURL-Auth

## Usage

```rust,no_run
// Endpoint can also be of the form:
// keyauth://domain.com/auth?key=val
let lnurl_auth_url = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttvdankjm3lw3skw0tvdankjm3xdvcn6vtp8q6n2dfsx5mrjwtrxdjnqvtzv56rzcnyv3jrxv3sxqmkyenrvv6kve3exv6nqdtyv43nqcmzvdsnvdrzx33rsenxx5unqc3cxgeqgntfgu";

if let Ok(LnUrlAuth{data: ad}) = parse(lnurl_auth_url).await {
    match sdk.lnurl_auth(ad).await {
        Ok(LnUrlCallbackStatus::Ok) => {
            info!("Successfully authenticated")
        }
        Ok(LnUrlCallbackStatus::ErrorStatus { data }) => {
            error!("Failed to authenticate: {}", data.reason)
        }
        Err(e) => {
            error!("Failed to connect: {e}")
        }
    }
}
```


## Supported Specs

- [LUD-01](https://github.com/lnurl/luds/blob/luds/01.md) LNURL bech32 encoding
- [LUD-04](https://github.com/lnurl/luds/blob/luds/04.md) `auth` base spec
- [LUD-17](https://github.com/lnurl/luds/blob/luds/17.md) Support for keyauth prefix with non-bech32-encoded LNURL URLs
