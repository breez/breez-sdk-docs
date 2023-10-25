# LNURL-Auth

## Usage
<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/lnurl_auth.rs:lnurl-auth}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
// Endpoint can also be of the form:
// keyauth://domain.com/auth?key=val
let lnurlAuthUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttvdankjm3lw3skw0tvdankjm3xdvcn6vtp8q6n2dfsx5mrjwtrxdjnqvtzv56rzcnyv3jrxv3sxqmkyenrvv6kve3exv6nqdtyv43nqcmzvdsnvdrzx33rsenxx5unqc3cxgeqgntfgu"

do {
 let inputType = try parseInput(s: lnurlAuthUrl)
 if case .lnUrlAuth(let data) = inputType {
   let result = try sdk.lnurlAuth(reqData: data)
   switch result {
   case .ok:
     print("Successfully authenticated")
   case .errorStatus(let data):
     print("Failed to authenticate")
   }
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
// keyauth://domain.com/auth?key=val
// lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7…
val lnurlAuthUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7…"
try {
    val inputType = parseInput(lnurlPayUrl)
    if (inputType is InputType.LnUrlAuth) {
        when (val result = sdk.lnurlAuth(inputType.data)) {
            LnUrlCallbackStatus.Ok -> Log.v("Breez", "Successfully authenticated")
            is LnUrlCallbackStatus.ErrorStatus -> Log.v("Breez", "Failed to authenticate: ${result.data.reason}")
        }
    }
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/lnurl_auth.ts:lnurl-auth}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/lnurl_auth.dart:lnurl-auth}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python_snippets/lnurl_auth.py:lnurl-auth}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/lnurl_auth.go:lnurl-auth}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/LnurlAuth.cs:lnurl-auth}}
```
</section>
</custom-tabs>

## Supported Specs

- [LUD-01](https://github.com/lnurl/luds/blob/luds/01.md) LNURL bech32 encoding
- [LUD-04](https://github.com/lnurl/luds/blob/luds/04.md) `auth` base spec
- [LUD-17](https://github.com/lnurl/luds/blob/luds/17.md) Support for keyauth prefix with non-bech32-encoded LNURL URLs
