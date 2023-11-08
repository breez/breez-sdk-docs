# List Payments

To view your payment history you can list and filter all the sent and received payments made.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/list_payments.rs:list-payments}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
do {
    let payments = try sdk.listPayments(req: ListPaymentsRequest(filter: PaymentTypeFilter.all))
} catch {
    // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
try {
    val payments = sdk.listPayments(ListPaymentsRequest(PaymentTypeFilter.ALL))
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/list_payments.ts:list-payments}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/list_payments.dart:list-payments}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
try:
  sdk_services.list_payments(breez_sdk.ListPaymentsRequest(breez_sdk.PaymentTypeFilter.All))
except Exception as error:
  # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/list_payments.go:list-payments}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ListPayments.cs:list-payments}}
```
</section>
</custom-tabs>

You can optionally filter payments by timestamp and include failed payments.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
{{#include ../../snippets/rust/src/list_payments.rs:list-payments-filtered}}
```
</section>

<div slot="title">Swift</div>
<section>

```swift,ignore
do {
    let payments = try sdk.listPayments(
        req: ListPaymentsRequest(
            filter: PaymentTypeFilter.sent,
            fromTimestamp: 1696880000,
            includeFailures: true,
        )
    )
} catch {
    // handle error
}
```
</section>

<div slot="title">Kotlin</div>
<section>

```kotlin,ignore
try {
    val payments = sdk.listPayments(ListPaymentsRequest(PaymentTypeFilter.SENT, fromTimestamp = 1696880000, includeFailures = true))
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
{{#include ../../snippets/react-native/list_payments.ts:list-payments-filtered}}
```
</section>

<div slot="title">Dart</div>
<section>

```dart,ignore
{{#include ../../snippets/dart_snippets/lib/list_payments.dart:list-payments-filtered}}
```
</section>

<div slot="title">Python</div>
<section>

```python,ignore
try:
  sdk_services.list_payments(
    breez_sdk.ListPaymentsRequest(
        breez_sdk.PaymentTypeFilter.Sent, 
        from_timestamp = 1696880000, 
        include_failures = True))
except Exception as error:
  # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go,ignore
{{#include ../../snippets/go/list_payments.go:list-payments-filtered}}
```
</section>

<div slot="title">C#</div>
<section>

```cs,ignore
{{#include ../../snippets/csharp/ListPayments.cs:list-payments-filtered}}
```
</section>
</custom-tabs>
