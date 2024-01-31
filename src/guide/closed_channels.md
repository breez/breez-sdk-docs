# Closed channels

On channel close the remaining funds will be sent to an onchain address. In order to redeem those funds you may do the following.

## Prepare Redeem Onchain Funds

First you may want to call prepare the transaction in order to get the transaction weight as well as the calculated fees before eventually broadcasting it.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/closed_channel.rs:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ClosedChannel.swift:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ClosedChannel.kt:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/closed_channel.ts:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/closed_channel.dart:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/closed_channel.py:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/closed_channel.go:prepare-redeem-onchain-funds}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ClosedChannel.cs:prepare-redeem-onchain-funds}}
```
</section>
</custom-tabs>

## Redeem Onchain Funds

In order to broadcast the redeem transaction do the following.
 
<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/closed_channel.rs:redeem-onchain-funds}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/ClosedChannel.swift:redeem-onchain-funds}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/ClosedChannel.kt:redeem-onchain-funds}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/closed_channel.ts:redeem-onchain-funds}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/closed_channel.dart:redeem-onchain-funds}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/closed_channel.py:redeem-onchain-funds}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/closed_channel.go:redeem-onchain-funds}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ClosedChannel.cs:redeem-onchain-funds}}
```
</section>
</custom-tabs>