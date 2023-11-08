package example

import (
    "log"

    "github.com/breez/breez-sdk-go/breez_sdk"
)

func LnurlPay() {
    // ANCHOR: lnurl-pay
    // Endpoint can also be of the form:
    // lnurlp://domain.com/lnurl-pay?key=val
    // lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
    lnurlPayUrl := "lightning@address.com"

    if input, err := breez_sdk.ParseInput(lnurlPayUrl); err != nil {
        switch inputType := input.(type) {
        case breez_sdk.InputTypeLnUrlPay:
            amountMsat := inputType.Data.MinSendable
            comment := "comment"
            lnUrlPayRequest := breez_sdk.LnUrlPayRequest{
                Data:       inputType.Data,
                AmountMsat: amountMsat,
                Comment:    &comment,
            }
            if result, err := sdk.PayLnurl(lnUrlPayRequest); err != nil {
                switch result.(type) {
                case breez_sdk.LnUrlPayResultEndpointSuccess:
                    log.Printf("Successfully paid")
                default:
                    log.Printf("Failed to pay")
                }
            }
        }
    }
    // ANCHOR_END: lnurl-pay
}
