import { sendPayment } from "@breeztech/react-native-breez-sdk"

const exampleSendLightningPayment = async () => {
    // ANCHOR: send-payment
    const bolt11 = "..."

    const sendPaymentResponse = await sendPayment({
        bolt11,
        amountMsat: 3000000
    })
    // ANCHOR_END: send-payment
}
