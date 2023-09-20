# Receiving an on-chain transaction (swap-in)
There are cases when you have funds in some bitcoin address and you would like to send those to your lightning node.

In such cases, the SDK might have to open a new channel, for which case you can specify an optional user-selected
channel opening fee[^1]. For simplicity, the examples below use the cheapest fee available.
In order to receive funds you first have to be connected to an [LSP](connecting_lsp.md).

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let swap_info = sdk.receive_onchain( 
    ReceiveOnchainRequest { opening_fee_params: None } )
    .await?;

// Send your funds to the below bitcoin address
let address = swap_info.bitcoin_address;
```
</section>

<div slot="title">Swift</div>
<section>

```swift
do {
  let swapInfo = try sdk.receiveOnchain(req: ReceiveOnchainRequest())

  // Send your funds to the bellow bitcoin address
  let address = swapInfo.bitcoinAddress;
} catch {
    // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
try {
    val swapInfo = sdk.receiveOnchain(ReceiveOnchainRequest())
    // Send your funds to the bellow bitcoin address
    val address = swapInfo.bitcoinAddress
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
try {
    const swapInfo = await receiveOnchain({})

    // Send your funds to the below bitcoin address
    const address = swapInfo.bitcoinAddress;
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    SwapInfo swapInfo = await receiveOnchain(ReceiveOnchainRequest());

    // Send your funds to the below bitcoin address
    String address = swapInfo.bitcoinAddress;
} catch (error) {
    // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
try: 
    swap_info = sdk_services.receive_onchain(breez_sdk.ReceiveOnchainRequest())

    # Send your funds to the below bitcoin address
    address = sdk_services.swap_info.bitcoin_address
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
if swapInfo, err := sdkServices.ReceiveOnchain(breez_sdk.ReceiveOnchainRequest{}); err != nil {
    // Send your funds to the below bitcoin address
    address := swapInfo.BitcoinAddress
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
try 
{
    var swapInfo = sdk.ReceiveOnchain(new ReceiveOnchainRequest());

    // Send your funds to the below bitcoin address
    var address = swapInfo.bitcoinAddress;
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>

Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let swap_info = sdk.in_progress_swap().await?
```
</section>

<div slot="title">Swift</div>
<section>

```swift
do {
  let swapInfo = try sdk.inProgressSwap()
} catch {
    // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
try {
    val swapInfo = sdk.inProgressSwap()
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
try {
    const swapInfo = await inProgressSwap()
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    SwapInfo? swapInfo = await inProgressSwap()
} catch (error) {
    // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
try:
    swap_info = sdk_services.in_progress_swap()
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
swapInfo, err := sdkServices.InProgressSwap()
```
</section>

<div slot="title">C#</div>
<section>

```cs
try 
{
    var swapInfo = sdk.InProgressSwap();
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>

The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout - this is the negative case where your node will execute a refund.

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let refundables = sdk.list_refundables().await?
```
</section>

<div slot="title">Swift</div>
<section>

```swift
do {
  let refundables = try sdk.listRefundables()
} catch {
    // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
try {
    val refundables = sdk.listRefundables()
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
try {
    const refundables = await listRefundables()
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
try {
    List<SwapInfo> refundables = await listRefundables()
} catch (error) {
     // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
try:
    refundables = sdk_services.list_refundables()
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
refundables, err := sdkServices.ListRefundables()
```
</section>

<div slot="title">C#</div>
<section>

```cs
try 
{
    var refundables = sdk.ListRefundables();
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>

Once you have a refundable swap in hand, use the following code to execute a refund:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let destination_address = "...".into()
let sat_per_vbyte = <refund tx fee rate>
sdk.refund(refundable.bitcoin_address, destination_address, sat_per_vbyte).await?
```
</section>

<div slot="title">Swift</div>
<section>

```swift
let destinationAddress = "..."
let satPerVbyte = <refund tx fee rate>

do {
  try sdk.refund(
      swapAddress: refundable?.bitcoinAddress, 
      toAddress: "...", 
      satPerVbyte: satPerVbyte)
} catch {
    // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
val swapAddress = "..."
val destinationAddress = "..."
val satPerVbyte = 1.toUInt()
try {
    sdk.refund(swapAddress, destinationAddress, satPerVbyte)
} catch (e: Exception) {
    // handle error
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
const destinationAddress = "..."
const satPerVbyte = <refund tx fee rate>
try {
    const result = await refund(refundable.bitcoinAddress, destinationAddress, satPerVbyte)
} catch (error) {
    console.log(error)
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
String destinationAddress = "..."
int satPerVbyte = <refund tx fee rate>
try {
    String result = await refund(
        swapAddress: refundable.bitcoinAddress,
        toAddress: destinationAddress,
        satPerVbyte: satPerVbyte,
     );
} catch (error) {
     // handle error
}
```
</section>

<div slot="title">Python</div>
<section>

```python
destination_address = "..."
sat_per_vbyte = <refund tx fee rate>

try:
    result = sdk_services.refund(
        swap_address=refundable.bitcoin_address,
        to_address=to_address,
        sat_per_vbyte=sat_per_vbyte)
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
destinationAddress := "..."
satPerVbyte := <refund tx fee rate>

result, err := sdkServices.Refund(refundable.BitcoinAddress, destinationAddress, satPerVbyte)
```
</section>

<div slot="title">C#</div>
<section>

```cs
var destinationAddress = "...";
var satPerVbyte = <refund tx fee rate>;
try 
{
    var result = sdk.Refund(refundable.bitcoinAddress, destinationAddress, satPerVbyte);
} 
catch (Exception) 
{
    // Handle error
}
```
</section>
</custom-tabs>

# Calculating fees

When the amount to be received exceeds the inbound liquidity of the node, a new channel will be opened by the LSP in order for the node to receive it. This can checked by retrieving the NodeState from the SDK and comparing the inbound liquidity to the amount to be received. If the amount is greater or equal to the inbound liquidity, a new channel opening is required.

To calculate the fees for a channel being opened by the LSP:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let amount_msat = <amount msat>;
let channel_fees = sdk.open_channel_fee(
    OpenChannelFeeRequest { amount_msat, expiry: None })
    .await?;
```
</section>

<div slot="title">Swift</div>
<section>

```swift 
let amountMsat = <amount msat>
do {
    let channelFees = try sdk.openChannelFee(
        req: OpenChannelFeeRequest(amountMsat: amountMsat))
} catch {
    // Handle error 
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin,ignore
// TODO add example for openChannelFee
```
</section>

<div slot="title">React Native</div>
<section>

```typescript 
const amountMsat = <amount msat>
try {
    const channelFees = await openChannelFee({amountMsat: amountMsat})
} catch (error) {
    // handle error
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
int amountMsats = <amount msats>
try {
    int channelFees = openChannelFee(OpenChannelFeeRequest(
        amountMsats: amountMsats,
        ),
    );
} catch {
    // Handle error 
}
```
</section>

<div slot="title">Python</div>
<section>

```python
amount_msat = <amount msats>
try:
    channel_fees = sdk_services.open_channel_fee(
        breez_sdk.OpenChannelFeeRequest(
            amount_msat=amount_msat))
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
amountMsat := <amount msat>
channelFees, err := sdkServices.OpenChannelFee(breez_sdk.OpenChannelFeeRequest{AmountMsat: amountMsat})
```
</section>

<div slot="title">C#</div>
<section>

```cs 
ulong amountMsat = <amount msat>;
var channelFees = sdk.OpenChannelFee(new OpenChannelFeeRequest(amountMsat));
```
</section>
</custom-tabs>


</custom-tabs>


[^1]: For more details on these fees, see [Channel Opening Fees](connecting_lsp.md#channel-opening-fees)
