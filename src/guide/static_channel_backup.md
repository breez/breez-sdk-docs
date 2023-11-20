# Static Channel Backup

A static channel backup is automatically saved by the Breez SDK in the background. More specifically, the static backup is updated
each time a new channel is opened.

The static channel backup can be used as a last resort to recover funds in case the Greenlight node becomes inaccessible. Recovering the funds is currently not part of the Breez SDK. In order to recover the funds, the user can initialize a new core lightning node with its [HSM secret](https://docs.corelightning.org/docs/hsm-secret) using their seed. Then trigger a channel recovery through [the recoverchannel method](https://docs.corelightning.org/reference/lightning-recoverchannel) provided by CLN.

In order to use the recoverchannel method, the user needs to provide the static channel backup file. It can be retrieved from the SDK's working directory as follows:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/static_channel_backup.rs:static-channel-backup}}
```

</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/StaticChannelBackup.swift:static-channel-backup}}
```

</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/StaticChannelBackup.kt:static-channel-backup}}
```

</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/static_channel_backup.ts:static-channel-backup}}
```

</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/static_channel_backup.dart:static-channel-backup}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/static_channel_backup.py:static-channel-backup}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/static_channel_backup.go:static-channel-backup}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/StaticChannelBackup.cs:static-channel-backup}}
```
</section>
</custom-tabs>
