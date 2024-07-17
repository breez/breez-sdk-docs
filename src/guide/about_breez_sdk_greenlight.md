# About the Breez SDK - *Greenlight*

## **What Is the Breez SDK?**

The Breez SDK provides developers with an end-to-end solution for integrating self-custodial Lightning payments into their apps and services. It eliminates the need for third-parties, simplifies the complexities of Bitcoin and Lightning, and enables seamless onboarding for billions of users to the future of peer-to-peer payments.

## **What Is the *Greenlight* Implementation?**

The *Greenlight* implementation is a cloud-based Lightning integration. It offers a self-custodial, end-to-end solution for integrating Lightning payments, utilizing nodes-on-demand provided by Blockstream’s Greenlight, with built-in Lightning Service Providers (LSP), on-chain interoperability, and third-party fiat on-ramps.

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

## How Does the Greenlight Implementation Work?

The *Greenlight* implementation allows end-users to send and receive payments using the Breez SDK through several key components:

- **Signer**: The app integrating the Breez SDK runs a validating signer that interacts with the end-user node.
- **Node**: End-user nodes are hosted on Blockstream’s Greenlight cloud infrastructure. The SDK creates a node when an end-user needs to send or receive a payment via the Lightning Network. Each end-user has their own node.
- **Lightning Service Providers (LSP)**: Design partners use LSPs, operated by entities other than Breez, to facilitate channel connectivity. LSP nodes are connected to Breez’s routing nodes, which in turn connect to other nodes in the Lightning Network.
- **Submarine Swaps**: Submarine swaps and reverse submarine swaps are used for transactions involving BTC addresses (on-chain). When receiving funds, submarine swaps convert the BTC to the user node on the Lightning Network. When sending funds to BTC addresses, reverse submarine swaps convert Lightning Network funds back to BTC.

## Pricing

The Breez SDK - *Greenlight* is **free** for developers.

## Support

Have a question for the team? Join us on [Telegram](https://t.me/breezsdk) or email us at [contact@breez.technology](mailto:contact@breez.technology).

### Ready to light up your app? **[Get started](https://sdk-doc.breez.technology/guide/getting_started.html).**
