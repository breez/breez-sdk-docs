# Using Webhooks

## Registering a Webhook

Once your vendor [NDS is set up](setup_nds.md) and can accept POST requests from the SDK services, you can within your main application register the webhook URL with the Breez SDK by calling the register webhook API as follows:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/webhook.rs:register-webook}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/Webhook.swift:register-webook}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/Webhook.kt:register-webook}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/webhook.ts:register-webook}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/webhook.dart:register-webook}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/webhook.py:register-webook}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/webhook.go:register-webook}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/Webhook.cs:register-webook}}
```
</section>
</custom-tabs>

When the NDS receives a POST request for the registered webhook URL, it will forward the request data via push notification to the applications Service Extension (iOS) or Foreground Service (Android) to be handled by the [Notification Plugin](setup_plugin.md).

## Unregistering a Webhook

When a webhook is no longer needed or the webhook URL has changed such that it needs unregistering (for example, the token is valid but the locale changes), you can call the unregister webhook API as follows:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/webhook.rs:unregister-webook}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/Webhook.swift:unregister-webook}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/Webhook.kt:unregister-webook}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/webhook.ts:unregister-webook}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/webhook.dart:unregister-webook}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/webhook.py:unregister-webook}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/webhook.go:unregister-webook}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/Webhook.cs:unregister-webook}}
```
</section>
</custom-tabs>