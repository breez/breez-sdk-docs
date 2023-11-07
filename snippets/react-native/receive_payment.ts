import { receivePayment } from "@breeztech/react-native-breez-sdk"

const exampleReceiveLightningPayment = async () => {
    // ANCHOR: receive-payment
    const invoice = await receivePayment({
        amountMsat: 3000000,
        description: "Invoice for 3000 sats"
    })
    // ANCHOR: receive-payment
}
