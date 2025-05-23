import breez_sdk


def pay(sdk_services):
    # ANCHOR: lnurl-pay
    # Endpoint can also be of the form:
    # lnurlp://domain.com/lnurl-pay?key=val
    # lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttsv9un7um9wdekjmmw84jxywf5x43rvv35xgmr2enrxanr2cfcvsmnwe3jxcukvde48qukgdec89snwde3vfjxvepjxpjnjvtpxd3kvdnxx5crxwpjvyunsephsz36jf
    lnurl_pay_url = "lightning@address.com"
    try: 
        parsed_input = breez_sdk.parse_input(s=lnurl_pay_url)
        if isinstance(parsed_input, breez_sdk.InputType.LN_URL_PAY):
            amount_msat = parsed_input.data.min_sendable
            use_trampoline = True
            optional_comment = "<comment>"
            optional_payment_label = "<label>"
            req = breez_sdk.LnUrlPayRequest(
                data=parsed_input.data,
                amount_msat=amount_msat,
                use_trampoline=use_trampoline,
                comment=optional_comment,
                payment_label=optional_payment_label)
            result = sdk_services.pay_lnurl(req=req)
            return result
    except Exception as error:
        print(error)
        raise 
    # ANCHOR_END: lnurl-pay
