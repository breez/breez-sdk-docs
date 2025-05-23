import breez_sdk


def withdraw(sdk_services):
    # ANCHOR: lnurl-withdraw
    # Endpoint can also be of the form:
    # lnurlw://domain.com/lnurl-withdraw?key=val
    lnurl_withdraw_url = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4exctthd96xserjv9mn7um9wdekjmmw843xxwpexdnxzen9vgunsvfexq6rvdecx93rgdmyxcuxverrvcursenpxvukzv3c8qunsdecx33nzwpnvg6ryc3hv93nzvecxgcxgwp3h33lxk"
    try:
        parsed_input = breez_sdk.parse_input(s=lnurl_withdraw_url)
        if isinstance(parsed_input, breez_sdk.InputType.LN_URL_WITHDRAW):
            amount_msat = parsed_input.data.min_withdrawable
            req = breez_sdk.LnUrlWithdrawRequest(
                data=parsed_input.data,
                amount_msat=amount_msat,
                description="comment")
            result = sdk_services.withdraw_lnurl(request=req)
            return result
    except Exception as error:
        print(error)
        raise
    # ANCHOR_END: lnurl-withdraw
