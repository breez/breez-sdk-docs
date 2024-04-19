package com.example.kotlinmpplib

import breez_sdk.*
class CommunicatingFees {
    fun get_fee_info_before_invoice_created(sdk: BlockingBreezServices) {
        // ANCHOR: get-fee-info-before-receiving-payment
        val inboundLiquidityMsat = sdk.nodeInfo()?.inboundLiquidityMsats ?: 0u
        val inboundLiquiditySat = inboundLiquidityMsat / 1_000u

        val openingFeeResponse = sdk.openChannelFee(OpenChannelFeeRequest(null))

        val openingFees = openingFeeResponse.feeParams;
        val feePercentage = (openingFees.proportional * 100u) / 1_000_000u
        val minFeeSat = openingFees.minMsat / 1_000u;

        if (inboundLiquiditySat == 0UL) {
            // Log.v("A setup fee of ${feePercentage}% with a minimum of ${minFeeSat} sats will be applied.");
        } else {
            // Log.v("A setup fee of ${feePercentage}% with a minimum of ${minFeeSat} sats will be applied for receiving more than ${inboundLiquiditySat} sats.");
        }
        // ANCHOR_END: get-fee-info-before-receiving-payment
    }

    fun get_fee_info_after_invoice_created(receivePaymentResponse: ReceivePaymentResponse) {
        // ANCHOR: get-fee-info-after-invoice-created
        val openingFeeSat = receivePaymentResponse.openingFeeMsat?.let{ it.div(1000UL).toULong() } ?: run { 0UL }
        // Log.v("Breez", "A setup fee of ${openingFeeSat} sats is applied to this invoice.")
        // ANCHOR_END: get-fee-info-after-invoice-created
    }

    fun get_fee_info_receive_onchain(sdk: BlockingBreezServices) {
        // ANCHOR: get-fee-info-receive-onchain
        val swapInfo = sdk.receiveOnchain(ReceiveOnchainRequest())

        val minDepositSat = swapInfo.minAllowedDeposit
        val maxDepositSat = swapInfo.maxAllowedDeposit
        val inboundLiquiditySat = (sdk.nodeInfo()?.inboundLiquidityMsats ?: 0u) / 1_000u

        val swapOpeningFees = swapInfo.channelOpeningFees
        if (swapOpeningFees != null) {
            val feePercentage = (swapOpeningFees.proportional * 100u) / 1_000_000u
            val minFeeSat = swapOpeningFees.minMsat / 1_000u;

            // Log.v("Send more than ${minDepositSat} sats and up to ${maxDepositSat} sats to this address. A setup fee of ${feePercentage}% with a minimum of ${minFeeSat} sats will be applied for sending more than ${inboundLiquiditySat} sats. This address can only be used once.");
        }
        // ANCHOR_END: get-fee-info-receive-onchain
    }
}