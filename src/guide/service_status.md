<h1 id="retrieving-service-status">
    <a class="header" href="#retrieving-service-status">Retrieving service status</a>
    <a class="tag" target="_blank" href="https://breez.github.io/breez-sdk-greenlight/breez_sdk_core/struct.BreezServices.html#method.service_health_check">API docs</a>
</h1>

You can check the general health status of the services provided by the Breez SDK. 
The response status will inform you if there is maintenance occurring, a service disruption or the services are operational.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/service_status.rs:health-check-status}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ServiceStatus.swift:health-check-status}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ServiceStatus.kt:health-check-status}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/service_status.ts:health-check-status}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/service_status.dart:health-check-status}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/service_status.py:health-check-status}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/service_status.go:health-check-status}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ServiceStatus.cs:health-check-status}}
```
</section>
</custom-tabs>


