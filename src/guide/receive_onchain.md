# Receiving an on-chain transaction (swap-in)
There are cases when you have funds in some bitcoin address and you would like to send those to your lightning node.

<custom-tabs category="lang">
<div slot="title">Rust</div>
<section>

```rust,ignore
let swap_info = sdk.receive_onchain().await?;

// Send your funds to the below bitcoin address
let address = swap_info.bitcoin_address;
```

Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

```rust,ignore
let swap_info = sdk.in_progress_swap().await?
```

The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout - this is the negative case where your node will execute a refund.

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:

```rust,ignore
let refundables = sdk.list_refundables().await?
```

Once you have a refundable swap in hand, use the following code to execute a refund:

```rust,ignore
let destination_address = "...".into()
let sat_per_vbyte = <refund tx fee rate>
sdk.refund(refundable.bitcoin_address, destination_address, sat_per_vbyte).await?
```
</section>
<div slot="title">Swift</div>
<section>

```swift
do {
  let swapInfo = try sdk.receiveOnchain()

  // Send your funds to the bellow bitcoin address
  let address = swapInfo.bitcoinAddress;
} catch {
    // handle error
}
```

Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

```swift
do {
  let swapInfo = try sdk.inProgressSwap()
} catch {
    // handle error
}
```

The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout - this is the negative case where your node will execute a refund.

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:

```swift
do {
  let refundables = try sdk.listRefundables()
} catch {
    // handle error
}
```

Once you have a refundable swap in hand, use the following code to execute a refund:

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
<div slot="title">React Native</div>
<section>

```typescript
try {
    const swapInfo = await receiveOnchain();

    // Send your funds to the below bitcoin address
    const address = swapInfo.bitcoinAddress;
} catch (error) {
    console.log(error)
}
```

Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

```typescript
try {
    const swapInfo = await inProgressSwap()
} catch (error) {
    console.log(error)
}
```

The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout - this is the negative case where your node will execute a refund.

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:

```typescript
try {
    const refundables = await listRefundables()
} catch (error) {
    console.log(error)
}
```

Once you have a refundable swap in hand, use the following code to execute a refund:

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
try {
    SwapInfo swapInfo = await receiveOnchain();

    // Send your funds to the below bitcoin address
    String address = swapInfo.bitcoinAddress;
} catch (error) {
    // handle error
}
```
Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

```dart
try {
    SwapInfo? swapInfo = await inProgressSwap()
} catch (error) {
    // handle error
}
```
The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout - this is the negative case where your node will execute a refund.

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:

```dart
try {
    List<SwapInfo> refundables = await listRefundables()
} catch (error) {
     // handle error
}
```

Once you have a refundable swap in hand, use the following code to execute a refund:

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
try: 
    swap_info = sdk_services.receive_onchain()
    # Send your funds to the below bitcoin address
    address = sdk_services.swap_info.bitcoin_address
except Exception as error:
    # Handle error
```

Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

```python
try:
    swap_info = sdk_services.in_progress_swap()
except Exception as error:
    # Handle error
```

The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout - this is the negative case where your node will execute a refund.

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:


Once you have a refundable swap in hand, use the following code to execute a refund:

```python
try:
    refundables = sdk_services.list_refundables()
except Exception as error:
    # Handle error
```

Once you have a refundable swap in hand, use the follwing code to execute a refund:

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
if swapInfo, err := sdkServices.ReceiveOnchain(); err != nil {
    // Send your funds to the below bitcoin address
    address := swapInfo.BitcoinAddress
}
```

Once you've sent the funds to the above address, the SDK will monitor this address for unspent confirmed outputs and use a trustless submarine swap to receive these into your Lightning node. You can always monitor the status of the current in-progress swap using the following code:

```go
swapInfo, err := sdkServices.InProgressSwap()
```

The process of receiving funds via an on-chain address is trustless and uses a submarine swap. This means there are two ways to spend the sent funds:

1. Either by a preimage that is exposed when the Lightning payment is completed - this is the positive case where the swap was successful.
2. Or by your node when the swap didn't complete within a certain timeout - this is the negative case where your node will execute a refund.

In order to execute a refund, you need to supply an on-chain address to where the refunded amount will be sent. The following code will retrieve the refundable swaps:

```go
refundables, err := sdkServices.ListRefundables()
```

Once you have a refundable swap in hand, use the follwing code to execute a refund:

```go
destinationAddress := "..."
satPerVbyte := <refund tx fee rate>

result, err := sdkServices.Refund(refundable.BitcoinAddress, destinationAddress, satPerVbyte)
```
</section>
</custom-tabs>

# Calculating fees

<custom-tabs category="lang">

<div slot="title">Rust</div>
<section>

When the amount to be received exceeds the inbound liquidity of the node, a new channel will be opened by the LSP in order for the node to receive it. This can checked by retrieving the NodeState from the SDK and comparing the inbound liquidity to the amount to be received. If the amount is greater or equal to the inbound liquidity, a new channel opening is required.

To calculate the fees for a channel being opened by the LSP:

```rust,ignore
async fn calculate_channel_opening_fee(amount_msat: u64) -> Result<u64> {
    let channel_opening_fee_needed = is_channel_opening_fee_needed(amount_msat, sdk.clone())?;
    match channel_opening_fee_needed {
        true => calculate_fees_for_amount(amount_msat).await,
        false => Ok(0),
    }
}
```

How to detect if open channel fees are needed.
```rust,ignore
fn is_channel_opening_fee_needed(amount_msats: u64) -> Result<bool> {
    let node_info = sdk.node_info()?.ok_or(anyhow!("No node info found"))?;
    Ok(node_info.inbound_liquidity_msats <= amount_msats)
}
```

LSP fees are calculated in two ways, either by a minimum fee set by the LSP or by a fee per myriad calculated based on the amount being received. If the fee calculated from the fee per myriad is less than the minimum fee, the minimum fee is used.

This information can be retrieved for each LSP and then calculated:

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
    let fee_sat = max(
        lsp_info.channel_minimum_fee_msat as u64,
        channel_dynamic_fee_msat,
    );
    Ok(fee_sat)
}
```

</section>

<div slot="title">Swift</div>
<section>

When the amount to be received exceeds the inbound liquidity of the node, a new channel will be opened by the LSP in order for the node to receive it. This can checked by retrieving the NodeState from the SDK and comparing the inbound liquidity to the amount to be received. If the amount is greater or equal to the inbound liquidity, a new channel opening is required.

To calculate the fees for a channel being opened by the LSP:

```swift 
func calculateChannelOpeningFee(amountStats: Int64) -> Int64? {
        var  channelOpeningFeeNeeded =  isChannelOpeningFeeNeeded(amountStats: amountStats)
        if channelOpeningFeeNeeded {
            return calculateFeesForAmount(amountStats: amountStats)
        }
        return nil
    }
```

How to detect if open channel fees are needed.
```swift 
func isChannelOpeningFeeNeeded(amountStats: Int64) -> Bool {
        do {
            let nodeInfo = try sdk.nodeInfo()
            
            if var liqudity = nodeInfo?.inboundLiquidityMsats{
                liqudity /= 1000
                print(liqudity)
                return amountStats >= liqudity
            }
            
        } catch {
            // Handle error
        }
        return false
    }
```

LSP fees are calculated in two ways, either by a minimum fee set by the LSP or by a fee per myriad calculated based on the amount being received. If the fee calculated from the fee per myriad is less than the minimum fee, the minimum fee is used.

This information can be retrieved for each LSP and then calculated:

```swift 
func calculateFeesForAmount(amountStats: Int64) -> Int64? {
        do {
            if let lspId = try sdk.lspId() {
                let lspInfo = try sdk.fetchLspInfo(lspId: lspId)
                
                // setupFee is the proportional fee charged based on the amount.
                let setupFee = lspInfo!.channelFeePermyriad / 100
                // minFee is the minimum fee required by the LSP to open a channel.
                let minFee = lspInfo!.channelMinimumFeeMsat / 1000
                
                // A setup fee of {setupFee}% with a minimum of {minFee} will be applied for sending more than {liquidity}.
                let channelFeesMsat = amountStats * setupFee / 1000
                return max(channelFeesMsat, minFee)
            }
        } catch {
            // Handle error
        }
        return nil
    }
```

</section>

<div slot="title">Dart</div>
<section>

When the amount to be received exceeds the inbound liquidity of the node, a new channel will be opened by the LSP in order for the node to receive it. This can checked by retrieving the NodeState from the SDK and comparing the inbound liquidity to the amount to be received. If the amount is greater or equal to the inbound liquidity, a new channel opening is required.

To calculate the fees for a channel being opened by the LSP:

```dart
int calculateChannelOpeningFee(int amountSats) async {
    bool isChannelOpeningFeeNeeded = await isChannelOpeningFeeNeeded(amountSats);
    return isChannelOpeningFeeNeeded ? calculateFeesForAmount(amountSats) : 0;
} 
```

How to detect if open channel fees are needed.

```dart
bool isChannelOpeningFeeNeeded(int amountSats) async {
    NodeState? nodeState = await getNodeState();
    int liquidity = nodeState.inboundLiquidityMsats ~/ 1000;
    // Check if we need to open channel.
    return amountSats >= liquidity;
}
```

LSP fees are calculated in two ways, either by a minimum fee set by the LSP or by a fee per myriad calculated based on the amount being received. If the fee calculated from the fee per myriad is less than the minimum fee, the minimum fee is used.

This information can be retrieved for each LSP and then calculated:

```dart
int calculateFeesForAmount(int amountSats) async {
    // We need to open channel so we are calculating the fees for the LSP.
    String? lspId = await getLspId();
    LSPInformation? lspInformation = await fetchLspInfo(lspId!);

    // setupFee is the proportional fee charged based on the amount.
    int setupFee = (lspInformation.channelFeePermyriad / 100);
    // minFee is the minimum fee required by the LSP to open a channel.
    int minFee = lspInfo.channelMinimumFeeMsat ~/ 1000;
    // A setup fee of {setupFee}% with a minimum of {minFee} will be applied for sending more than {liquidity}.

    int channelFeesMsat = (amountSats * setupFee ~/ 100);
    // If the proportional fee is smaller than minimum fees, minimum fees is selected.
    return max(channelFeesMsat, minFee);
}
```
</section>


<div slot="title">Python</div>
<section>

When the amount to be received exceeds the inbound liquidity of the node, a new channel will be opened by the LSP in order for the node to receive it. This can checked by retrieving the NodeState from the SDK and comparing the inbound liquidity to the amount to be received. If the amount is greater or equal to the inbound liquidity, a new channel opening is required.

To calculate the fees for a channel being opened by the LSP:

```python
def calculate_channel_opening_fees(amount_sats):
    is_channel_opening_fee_needed = is_channel_opening_fee_needed()

    if is_channel_opening_fee_needed:
        return calculate_fees_for_amount(amount_sats)
    else: 
        return None
```

How to detect if open channel fees are needed.

```python
def is_channel_opening_fee_needed(amount_sats):
    liqudity = sdk_services.node_info().inbound_liquidity_msats // 1000
    return amount_sats >= liqudity
```

LSP fees are calculated in two ways, either by a minimum fee set by the LSP or by a fee per myriad calculated based on the amount being received. If the fee calculated from the fee per myriad is less than the minimum fee, the minimum fee is used.

This information can be retrieved for each LSP and then calculated:

```python
def calculate_fees_for_amount(amount_sats):
    # We need to open channel so we are calculating the fees for the LSP.
    lsp_id = sdk_services.lsp_id()
    lsp_info = sdk_services.fetch_lsp_info()

    # setup_fee is the proportional fee charged based on the amount.
    setup_fee = lsp_info.channel_fee_permyriad / 100

    # min_fee is the minimum fee required by the LSP to open a channel.
    min_fee = lsp_info.channel_minimum_fee_msat // 1000

    # A setup fee of {setup_fee} with a minimum of {min_fee} will be applied for sending more than {liquidity}.
    channel_fee_msat = amount_sats * setup_fee // 1000

    return max(channel_fee_msat, min_fee)
```
</section>

<div slot="title">Go</div>
<section>

When the amount to be received exceeds the inbound liquidity of the node, a new channel will be opened by the LSP in order for the node to receive it. This can checked by retrieving the NodeState from the SDK and comparing the inbound liquidity to the amount to be received. If the amount is greater or equal to the inbound liquidity, a new channel opening is required.

To calculate the fees for a channel being opened by the LSP:

```go
func CalculateChannelOpeningFee(amountSats uint64) (uint64, error) {
	isChannelOpeningFeeNeeded := isChannelOpeningFeeNeeded(amountSats)
	if !isChannelOpeningFeeNeeded {
		return 0, fmt.Errorf("Channel not needed")
	}
	return calculateFeesForAmount(amountSats), nil
}
```

How to detect if open channel fees are needed.
```go
func isChannelOpeningFeeNeeded(amountSats uint64) bool {
	nodeInfo, err := sdkServices.NodeInfo()
	if err != nil {
		// Handle error
	}
	liqudity := nodeInfo.InboundLiquidityMsats / 1000
	return amountSats >= liqudity
}
```

LSP fees are calculated in two ways, either by a minimum fee set by the LSP or by a fee per myriad calculated based on the amount being received. If the fee calculated from the fee per myriad is less than the minimum fee, the minimum fee is used.

This information can be retrieved for each LSP and then calculated:

```go
func calculateFeesForAmount(amountSats uint64) uint64 {
    // We need to open channel so we are calculating the fees for the LSP
	lspId, err := sdkServices.LspId()
	if err != nil {
		// Handle error
	}
	lspInfo, err := sdkServices.FetchLspInfo(*lspId)
	if err != nil {
		// Handle error
	}
    // setupFee is the proportional fee charged based on the amount
	setupFee := lspInfo.ChannelMinimumFeeMsat / 1000

    // minFee is the minimum fee required by the LSP to open a channel.
	minFee := lspInfo.ChannelMinimumFeeMsat / 1000

    // A setup fee of {setupFee}% with a minimum of {minFee} will be applied for sending more than {liquidity}.
	channelFeeMSat := amountSats * uint64(setupFee) / 1000
	if channelFeeMSat > uint64(minFee) {
		return channelFeeMSat
	}
	return uint64(minFee)
}
```

</section>

</custom-tabs>