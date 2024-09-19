# About the Breez SDK - Native *(Greenlight Implementation)*

## **What Is the Breez SDK?**

The Breez SDK provides developers with an end-to-end solution for integrating self-custodial Lightning payments into their apps and services. It eliminates the need for third parties, simplifies the complexities of Bitcoin and Lightning, and enables seamless onboarding for billions of users to the future of peer-to-peer payments.

To provide the best experience for their end-users, developers can choose between the following implementations:

- [Breez SDK - Native *(Greenlight Implementation)*](../guide/about_breez_sdk_greenlight.md#what-is-the-greenlight-implementation)
- [Breez SDK - Nodeless *(Liquid Implementation)*](https://sdk-doc-liquid.breez.technology/)

## **What Is the Breez SDK - Native *(Greenlight Implementation)*?**

It's a cloud-based Lightning integration that offers a self-custodial, end-to-end solution for integrating Lightning payments, utilizing nodes-on-demand provided by Blockstream’s Greenlight, with built-in Lightning Service Providers (LSP), on-chain interoperability, and third-party fiat on-ramps.

**Core Functions**

- **Sending payments** *via protocols such as: bolt11, keysend, lnurl-pay, lightning address, btc address.*
- **Receiving payments** *via protocols such as: bolt11, lnurl-withdraw, btc address.*
- **Interacting with a node** *e.g. balance, max allow to pay, max allow to receive, on-chain balance.*

**Key Features**

- [x]  On-chain interoperability
- [x]  Built-in LSP
- [x]  Integrated watchtower
- [x]  LNURL functionality
- [x]  Multi-app support
- [x]  Multi-device support
- [x]  Real-time state backup
- [x]  Keys are only held by users
- [x]  Fiat on-ramps
- [x]  Open-source

## How Does the Native *(Greenlight Implementation)* Work?

The Breez SDK - Native *(Greenlight Implementation)* allows end-users to send and receive payments using the Breez SDK through several key components:

- **Signer**: The app integrating the Breez SDK runs a validating signer that interacts with the end-user node.
  
- **Node**: End-user nodes are hosted on Blockstream’s Greenlight cloud infrastructure. The SDK creates a node when an end-user needs to send or receive a payment via the Lightning Network. Each end-user has their own node.

- **Lightning Service Providers (LSP)**: Design partners use LSPs, operated by entities other than Breez, to facilitate channel connectivity. LSP nodes are connected to Breez’s routing nodes, which in turn connect to other nodes in the Lightning Network.

- **Submarine Swaps**: Submarine swaps and reverse submarine swaps are used for transactions involving BTC addresses (on-chain). When receiving funds, submarine swaps convert the BTC to the user node on the Lightning Network. When sending funds to BTC addresses, reverse submarine swaps convert Lightning Network funds back to BTC.

![Breez SDK - Greenlight](https://github.com/breez/breez-sdk-docs/raw/main/src/images/BreezSDK_Greenlight.png)

### **Differences Between Implementations**

| Native *(Greenlight Implementation)* | Nodeless *(Liquid Implementation)* |
| --- | --- |
| Pure Lightning Network implementation | Trust profile is with the Liquid sidechain |
| Uses Lightning Service Providers (LSPs) for liquidity | No channel management or LSP required |
| Channel open and closing fees | No setup fees for end-users |
| No minimum limit for transactions (after channel opening) | Minimum payment size of 1,000 sats |
| Setup costs are correlated to Bitcoin mining fees | Static Liquid on-chain fees |
| Requires an API key | Does not require an API key |


## Pricing

The Breez SDK is **free** for developers.

## Support

Have a question for the team? Join us on [Telegram](https://t.me/breezsdk) or email us at [contact@breez.technology](mailto:contact@breez.technology).

## Repository

Head over to the [Breez SDK - Native *(Greenlight Implementation)* repo](https://github.com/breez/breez-sdk).

### Ready to light up your app? **[Get started.](https://sdk-doc.breez.technology/guide/getting_started.html)**
