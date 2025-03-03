<h1 id="reporting-payment-failures">
    <a class="header" href="#reporting-payment-failures">Reporting payment failures</a>
    <a class="tag" target="_blank" href="https://breez.github.io/breez-sdk-greenlight/breez_sdk_core/struct.BreezServices.html#method.report_issue">API docs</a>
</h1>

While attempting to send payments it may be that sometimes payment failures occur. Reporting these issues through the Breez SDK will help us to improve LSP routing.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/service_status.rs:report-payment-failure}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ServiceStatus.swift:report-payment-failure}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ServiceStatus.kt:report-payment-failure}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/service_status.ts:report-payment-failure}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/service_status.dart:report-payment-failure}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/service_status.py:report-payment-failure}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/service_status.go:report-payment-failure}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ServiceStatus.cs:report-payment-failure}}
```
</section>
</custom-tabs>
