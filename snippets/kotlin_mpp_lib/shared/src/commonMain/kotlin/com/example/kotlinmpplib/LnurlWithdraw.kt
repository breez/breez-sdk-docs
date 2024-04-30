package com.example.kotlinmpplib

import breez_sdk.*
class LnurlWithdraw {
    fun lnurlWithdraw(sdk: BlockingBreezServices) {
        // ANCHOR: lnurl-withdraw
        // Endpoint can also be of the form:
        // lnurlw://domain.com/lnurl-withdraw?key=val
        val lnurlWithdrawUrl = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7..."
        try {
            val inputType = parseInput(lnurlWithdrawUrl)
            if (inputType is InputType.LnUrlWithdraw) {
                val requestData = inputType.data
                val amountMsat = requestData.minWithdrawable
                val comment = "Any comment"
                sdk.withdrawLnurl(LnUrlWithdrawRequest(requestData, amountMsat, comment))
            }
        } catch (e: Exception) {
            // handle error
        }
        // ANCHOR_END: lnurl-withdraw
    }
}