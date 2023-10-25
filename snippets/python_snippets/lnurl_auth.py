import breez_sdk
import logging

sdk_services = breez_sdk.BlockingBreezServices

def auth():
    # ANCHOR: lnurl-auth
    # Endpoint can also be of the form:
    # keyauth://domain.com/auth?key=val
    lnurl_auth_url = "lnurl1dp68gurn8ghj7mr0vdskc6r0wd6z7mrww4excttvdankjm3lw3skw0tvdankjm3xdvcn6vtp8q6n2dfsx5mrjwtrxdjnqvtzv56rzcnyv3jrxv3sxqmkyenrvv6kve3exv6nqdtyv43nqcmzvdsnvdrzx33rsenxx5unqc3cxgeqgntfgu"

    try:
      parsed_input = breez_sdk.parse_input(lnurl_auth_url)     
      if isinstance(parsed_input, breez_sdk.InputType.LN_URL_AUTH):      
        req = breez_sdk
        result = sdk_services.lnurl_auth(parsed_input.data)        
      if result.is_ok():
        logging.info("Successfully authenticated")
      else:
        logging.error("Failed to authenticate")
    except Exception as error:
        logging.error(error)
        raise
    # ANCHOR_END: lnurl-auth