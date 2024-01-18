# Adding and filtering for payment metadata

## Usage

As developers, we understand the necessity to associate external metadata to a certain payment. The Breez SDK allows you to easily do so with the `set_payment_metadata` method:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/metadata.rs:set-payment-metadata}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/Metadata.swift:set-payment-metadata}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/Metadata.kt:set-payment-metadata}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/metadata.ts:set-payment-metadata}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/metadata.dart:set-payment-metadata}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/metadata.py:set-payment-metadata}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/metadata.go:set-payment-metadata}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/Metadata.cs:set-payment-metadata}}
```
</section>

</custom-tabs>

Once the metadata has been set, you can filter for the specified value using the `list_payments` method:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/metadata.rs:filter-payment-metadata}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/Metadata.swift:filter-payment-metadata}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/Metadata.kt:filter-payment-metadata}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/metadata.ts:filter-payment-metadata}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/metadata.dart:filter-payment-metadata}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/metadata.py:filter-payment-metadata}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/metadata.go:filter-payment-metadata}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/Metadata.cs:filter-payment-metadata}}
```
</section>

</custom-tabs>

## Caveats

Searching for metadata is flexible, allowing you to search and compare all JSON-supported types (nested ones too, using [JSONPath](https://www.ibm.com/docs/en/netezza?topic=ddt-jsonpath)), but with a couple of caveats:

### 2.1 Filtering for Strings

Since the filter works as a one-to-one comparison to the JSON value, strings **must** be wrapped in double-quotes in order to be properly filtered:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/metadata.rs:filter-payment-metadata-string}}
```

</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/Metadata.swift:filter-payment-metadata-string}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/Metadata.kt:filter-payment-metadata-string}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/metadata.ts:filter-payment-metadata-string}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/metadata.dart:filter-payment-metadata-string}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/metadata.py:filter-payment-metadata-string}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/metadata.go:filter-payment-metadata-string}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/Metadata.cs:filter-payment-metadata-string}}
```
</section>

</custom-tabs>

### 2.2 Filtering for Objects/Arrays

You can also compare complex objects against one another, but be careful of whitespaces! Since those are stripped during insertion, passing non-stripped filters will result in improper matching. For example, given the following metadata:

<section>
<pre>
{
 "isNested": true,
 "parent": {  
  "nestedArray": [1, 2, 3]
 }
}
</pre>
</section>

You would filter for payments matching the nested array as follows:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/metadata.rs:filter-payment-metadata-object}}
```

In Rust's case, this check can easily be overcome by using the [serde_json](https://docs.rs/serde_json/latest/serde_json/) crate (which you probably should be using anyway to serialize and insert the metadata):

```rust,ignore
{{#include ../../snippets/rust/src/metadata.rs:filter-payment-metadata-object-serde}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
{{#include ../../snippets/swift/BreezSDKExamples/Sources/Metadata.swift:filter-payment-metadata-object}}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
{{#include ../../snippets/kotlin_mpp_lib/shared/src/commonMain/kotlin/com/example/kotlinmpplib/Metadata.kt:filter-payment-metadata-object}}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/metadata.ts:filter-payment-metadata-object}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/metadata.dart:filter-payment-metadata-object}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
{{#include ../../snippets/python/src/metadata.py:filter-payment-metadata-object}}
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/metadata.go:filter-payment-metadata-object}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/Metadata.cs:filter-payment-metadata-object}}
```
</section>

</custom-tabs>

### 2.3 Same-key Insertion

In case the same key were to be specified twice during insertion, the _last_ one occurring in the string is taken as valid by default. E.g.

<section>
<pre>
{
 "completed": true,
 "completed": false
}
</pre>
</section>

will insert the value as `false`.

### 2.4 Size Limits

Currently, the SDK limits metadata storage per payment to 1,000 UTF-8 encoded characters, and any insertion beyond that will fail.
