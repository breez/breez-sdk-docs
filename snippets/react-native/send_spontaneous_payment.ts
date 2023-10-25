import { sendSpontaneousPayment } from "@breeztech/react-native-breez-sdk"

const exampleSendSpontaneousPayment = async () => {
    // ANCHOR: send-spontaneous-payment
    const nodeId = "..."

    const sendPaymentResponse = await sendSpontaneousPayment({
        nodeId,
        amountMsat: 3000000
    })
    // ANCHOR_END: send-spontaneous-payment
}
