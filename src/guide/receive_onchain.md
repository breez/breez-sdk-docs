# Receiving an on-chain transaction (swap-in)
There are cases when you have funds in some bitcoin address and you would like to send those to your lightning node.

In such cases, the SDK might have to open a new channel, for which case you can specify an optional user-selected
channel opening fee[^1]. For simplicity, the examples below use the cheapest fee available.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
// Optional user-selected dynamic fees (here: first in list, which is the cheapest)
let opening_fee_params = sdk.lsp_info().await?.opening_fee_params_list.values.get(0).cloned();

let swap_info = sdk.receive_onchain( ReceiveOnchainRequest { opening_fee_params } ).await?;

// Send your funds to the below bitcoin address
let address = swap_info.bitcoin_address;
```
</section>

<div slot="title">Swift</div>
<section>

```swift
do {
  // Optional user-selected dynamic fees (here: first in list, which is the cheapest)
  let lsp_info = try sdk.lsp_info();
  let opening_fee_params = lsp_info?.opening_fee_params_list.values.first();
  let request = ReceiveOnchainRequest(opening_fee_params: opening_fee_params);

  let swapInfo = try sdk.receiveOnchain(req: request)

  // Send your funds to the bellow bitcoin address
  let address = swapInfo.bitcoinAddress;
} catch {
    // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
try {
    val swapInfo = sdk.receiveOnchain()
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
    // Optional user-selected dynamic fees (here: first in list, which is the cheapest)
    const id = await lspId()
    const lspInfo = await fetchLspInfo(id)
    const openingFeeParams = lspInfo.openingFeeParamsList.values[0]
    const request = {openingFeeParams: openingFeeParams}

    const swapInfo = await receiveOnchain(request)

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
    // Optional user-selected dynamic fees (here: first in list, which is the cheapest)
    LspInformation lspInfo = await lspInfo();
    OpeningFeeParams? openingFeeParams = lspInfo.opening_fee_params_list.values.first;
    ReceiveOnchainRequest request = new ReceiveOnchainRequest(openingFeeParams);
    
    SwapInfo swapInfo = await receiveOnchain(request);

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
    # Optional user-selected dynamic fees (here: first in list, which is the cheapest)
    lsp_info = sdk_services.lsp_info()
    opening_fee_params = lsp_info.opening_fee_params_list.values[0]
    request = ReceiveOnchainRequest(opening_fee_params=opening_fee_params)

    swap_info = sdk_services.receive_onchain(req=request)
    
    # Send your funds to the below bitcoin address
    address = sdk_services.swap_info.bitcoin_address
except Exception as error:
    # Handle error
```
</section>

<div slot="title">Go</div>
<section>

```go
// Optional user-selected dynamic fees (here: first in list, which is the cheapest)
lspInfo, err := sdkServices.LspInfo()
request := breez_sdk.ReceiveOnchainRequest{
    OpeningFeeParams: &lspInfo.openingFeeParamsList.values[0],
}

if swapInfo, err := sdkServices.ReceiveOnchain(request); err != nil {
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
    // Optional user-selected dynamic fees (here: first in list, which is the cheapest)
    var lspInfo = sdk.LspInfo();
    var openingFeeParams = lspInfo.openingFeeParamsList.values[0];
    var request = new ReceiveOnchainRequest(openingFeeParams);

    var swapInfo = sdk.ReceiveOnchain(request);

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

```kotlin
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

```kotlin
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
   swapAddress: "",
   toAddress: destinationAddress,
   satPerVbyte: satPerVbyte)
} catch {
    // handle error
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
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
    sdk_services.refund(refundable.bitcoin_address, destination_address, sat_per_vbyte)
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
async fn calculate_channel_opening_fee(amount_msat: u64) -> Result<u64> {
    let channel_opening_fee_needed = is_channel_opening_fee_needed(amount_msat, sdk.clone())?;
    match channel_opening_fee_needed {
        true => calculate_fees_for_amount(amount_msat).await,
        false => Ok(0),
    }
}
```
</section>

<div slot="title">Swift</div>
<section>

```swift 
func calculateChannelOpeningFee(amountMsats: Int64) -> Int64? {
    var channelOpeningFeeNeeded = isChannelOpeningFeeNeeded(amountMsats: amountMsats)
    if channelOpeningFeeNeeded {
        return calculateFeesForAmount(amountMsats: amountMsats)
    }
    return nil
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
fun calculateChannelOpeningFee(amountMsats: Long): Long? {
    val channelOpeningFeeNeeded = isChannelOpeningFeeNeeded(amountMsats)
    if (channelOpeningFeeNeeded) {
        return calculateFeesForAmount(amountMsats)
    }
    return null
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript 
const calculateChannelOpeningFee = async (amountMsats: number): number => {
    const channelOpeningFeeNeeded = await isChannelOpeningFeeNeeded(amountMsats)
    if (channelOpeningFeeNeeded) {
        return calculateFeesForAmount(amountMsats)
    }
    return 0
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
int calculateChannelOpeningFee(int amountMsat) async {
    bool isChannelOpeningFeeNeeded = await isChannelOpeningFeeNeeded(amountMsat);
    return isChannelOpeningFeeNeeded ? calculateFeesForAmount(amountMsat) : 0;
} 
```
</section>

<div slot="title">Python</div>
<section>

```python
def calculate_channel_opening_fees(amount_msats):
    is_channel_opening_fee_needed = is_channel_opening_fee_needed()

    if is_channel_opening_fee_needed:
        return calculate_fees_for_amount(amount_msats)
    else: 
        return None
```
</section>

<div slot="title">Go</div>
<section>

```go
func CalculateChannelOpeningFee(amountMsats uint64) (uint64, error) {
	isChannelOpeningFeeNeeded := isChannelOpeningFeeNeeded(amountMsats)
	if !isChannelOpeningFeeNeeded {
        return 0, fmt.Errorf("Channel not needed")
	}
	return calculateFeesForAmount(amountMsats), nil
}
```
</section>

<div slot="title">C#</div>
<section>

```cs 
ulong calculateChannelOpeningFee(ulong amountMsats) 
{
    var channelOpeningFeeNeeded = isChannelOpeningFeeNeeded(amountMsats);
    if (channelOpeningFeeNeeded) 
    {
        return calculateFeesForAmount(amountMsats);
    }
    return 0;
}
```
</section>
</custom-tabs>

How to detect if open channel fees are needed:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
fn is_channel_opening_fee_needed(amount_msats: u64) -> Result<bool> {
    let node_info = sdk.node_info()?.ok_or(anyhow!("No node info found"))?;
    Ok(node_info.inbound_liquidity_msats <= amount_msats)
}
```
</section>

<div slot="title">Swift</div>
<section>

```swift 
func isChannelOpeningFeeNeeded(amountMsats: Int64) -> Bool {
    do {
        let nodeInfo = try sdk.nodeInfo()

        if let inboundLiquidityMsats = nodeInfo?.inboundLiquidityMsats {
            return inboundLiquidityMsats <= amountMsats
        }   
    } catch {
        // Handle error
    }
    return false
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
fun isChannelOpeningFeeNeeded(amountMsats: Long): Boolean {
    try {
        val nodeInfo = sdk.nodeInfo()
        val inboundLiquidityMsats = nodeInfo?.inboundLiquidityMsats?.toLong()
        if (inboundLiquidityMsats != null) {
            return inboundLiquidityMsats <= amountMsats
        }
    } catch (e: Exception) {
        // Handle error
    }
    return false
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript
const isChannelOpeningFeeNeeded = async (amountMsats: number): boolean => {
    try {
        const nodeInfo = await nodeInfo()
        return nodeInfo.inboundLiquidityMsats <= amountMsats            
    } catch (error) {
        // handle error
    }
    return false
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
// Assumes nodeState isn't empty
bool isChannelOpeningFeeNeeded(int amountMsat) async {
    NodeState? nodeState = await getNodeState();
    return amountMsat >= nodeState.inboundLiquidityMsats;
}
```
</section>

<div slot="title">Python</div>
<section>

```python
def is_channel_opening_fee_needed(amount_msats):
    return sdk_services.node_info().inbound_liquidity_msats <= amount_msats
```
</section>

<div slot="title">Go</div>
<section>

```go
func isChannelOpeningFeeNeeded(amountMsats uint64) bool {
	nodeInfo, err := sdkServices.NodeInfo()
	if err != nil {
        // Handle error
	}
	return nodeInfo.InboundLiquidityMsats <= amountMsats 
}
```
</section>

<div slot="title">C#</div>
<section>

```cs
bool isChannelOpeningFeeNeeded(ulong amountMsats) 
{
    try 
    {
        var nodeInfo = sdk.NodeInfo();
        return nodeInfo.inboundLiquidityMsats <= amountMsats;         
    } 
    catch (Exception) 
    {
        // handle error
    }

    return false;
}
```
</section>
</custom-tabs>

LSP fees are calculated in two ways, either by a minimum fee set by the LSP or by a fee per myriad calculated based on the amount being received. If the fee calculated from the fee per myriad is less than the minimum fee, the minimum fee is used.

This information can be retrieved for each LSP and then calculated:

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
async fn calculate_fees_for_amount(amount_msat: u64) -> Result<u64> {
    let lsp_id = sdk.lsp_id().await?.ok_or(anyhow!("No lsp id found"))?;
    let lsp_info = sdk
        .fetch_lsp_info(lsp_id)
        .await?
        .ok_or(anyhow!("No lsp id found"))?;

    // We calculate the dynamic fees in millisatoshis rounded to satoshis.
    let channel_dynamic_fee_msat =
        amount_msat * lsp_info.channel_fee_permyriad as u64 / 10_000 / 1000 * 1000;
    let fee_msat = max(
        lsp_info.channel_minimum_fee_msat as u64,
        channel_dynamic_fee_msat,
    )
    Ok(fee_msat)
}
```
</section>

<div slot="title">Swift</div>
<section>

```swift 
func calculateFeesForAmount(amountMsats: Int64) -> Int64? {
    do {
        if let lspId = try sdk.lspId() {
            let lspInfo = try sdk.fetchLspInfo(lspId: lspId)
                
            // We calculate the dynamic fees in millisatoshis rounded to satoshis.
            let channelDynamicFeeMsat = amountMsats * lspInfo!.channelFeePermyriad / 10_000 / 1000 * 1000
            let feeMsat = max(lspInfo!.channelMinimumFeeMsat, channelDynamicFeeMsat)
                
            return feeMsat
        }
    } catch {
        // Handle error
    }
    return nil
}
```
</section>

<div slot="title">Android</div>
<section>

```kotlin
fun calculateFeesForAmount(amountMsats: Long): Long? {
    try {
        val lspId = sdk.lspId() ?: return null
        val lspInfo = sdk.fetchLspInfo(lspId) ?: return null
        // We calculate the dynamic fees in millisatoshis rounded to satoshis.
        val channelDynamicFeeMsat = amountMsats * lspInfo.channelFeePermyriad / 1000
        return lspInfo.channelMinimumFeeMsat.coerceAtLeast(channelDynamicFeeMsat)
    } catch (e: Exception) {
        // Handle error
    }
    return null
}
```
</section>

<div slot="title">React Native</div>
<section>

```typescript 
const calculateFeesForAmount = async (amountMsats: number): number => {
    try {
        const id = await lspId()
        const lspInfo = await fetchLspInfo(id)
                
        // We calculate the dynamic fees in millisatoshis rounded to satoshis.
        const channelDynamicFeeMsat = amountMsats * lspInfo.channelFeePermyriad / 10000 / 1000 * 1000
        const feeMsat = Math.max(lspInfo.channelMinimumFeeMsat, channelDynamicFeeMsat)
                
        return feeMsat
    } catch (error) {
        // handle error
    }
    return 0
}
```
</section>

<div slot="title">Dart</div>
<section>

```dart
// Assumes lspId & lspInformation isn't empty
int calculateFeesForAmount(int amountMsat) async {
    String? lspId = await getLspId();
    LSPInformation? lspInformation = await fetchLspInfo(lspId);

    // We calculate the dynamic fees in millisatoshis rounded to satoshis.
    int channelFeesMsat = (amountMsat * lspInformation.channelFeePermyriad / 10000 / 1000 * 1000);
    return max(channelFeesMsat, lspInformation.channelMinimumFeeMsat);
}
```
</section>

<div slot="title">Python</div>
<section>

```python
def calculate_fees_for_amount(amount_msats):
    # We need to open channel so we are calculating the fees for the LSP.
    lsp_id = sdk_services.lsp_id()
    lsp_info = sdk_services.fetch_lsp_info()

    # We calculate the dynamic fees in millisatoshis rounded to satoshis.
    channel_dynamic_fee = amount_msats * lsp_info.channel_minimum_fee_msat * lsp_info.channel_fee_permyriad / 10000 // 10000 * 10000

    fee_msat = max(lsp_info.channel_minimum_fee_msat, channel_dynamic_fee)

    return fee_msat
```
</section>

<div slot="title">Go</div>
<section>

```go
func calculateFeesForAmount(amountMsats uint64) uint64 {
    lspId, err := sdkServices.LspId()
    if err != nil {
        // Handle error
    }

    lspInfo, err := sdkServices.FetchLspInfo(*lspId)
    if err != nil {
        // Handle error
    }

    // We calculate the dynamic fees in millisatoshis rounded to satoshis
    channelDynamicFeeMsats := amountMsats * uint64(lspInfo.ChannelFeePermyriad) / 10000 / 1000 * 1000
    feeMsats := uint64(lspInfo.ChannelMinimumFeeMsat)

    if channelDynamicFeeMsats >= feeMsats {
        feeMsats = channelDynamicFeeMsats
    }

    return feeMsats
}
```
</section>

<div slot="title">C#</div>
<section>

```cs 
ulong calculateFeesForAmount(ulong amountMsats)
{
    try 
    {
        var id = sdk.LspId();
        var lspInfo = sdk.FetchLspInfo(id);
                
        // We calculate the dynamic fees in millisatoshis rounded to satoshis.
        var channelDynamicFeeMsat = amountMsats * (ulong)lspInfo.channelFeePermyriad / 10000 / 1000 * 1000;
        var feeMsat = Math.Max((ulong)lspInfo.channelMinimumFeeMsat, channelDynamicFeeMsat);
                
        return feeMsat;
    } 
    catch (Exception) 
    {
        // Handle error
    }

    return 0;
}
```
</section>
</custom-tabs>


[^1]: For more details on these fees, see [Channel Opening Fees](connecting_lsp.md#channel-opening-fees)