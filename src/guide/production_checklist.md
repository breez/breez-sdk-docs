# Production checklist
There are some usecases where you need to verify that are implemented correctly. Here is a checklist that you can use to verify that your application is production ready.

- **Closed channels**: Make sure you allow your users to redeem their onchain balance in case their channels were closed. see [Handling channel closures](guide/closed_channels.md)

- **Pending payments**: Payments always contain a status field that can be used to determine if the payment was completed or not. Make sure you handle the case where the payment is still pending by showing the correct status to the user.

- **Handle swaps refunds**: Swaps that are the result of [Receiving an On-Chain Transaction](guide/receive_onchain.md) may not be completed and turn into `Refundable` state. Make sure you handle this case correctly by allowing the user to retry the [refund](receive_onchain.html#refund-a-swap) with different fees as long as the refund is not confirmed. A confirmed refund changes the swap status from `Refundable` to `Completed`.