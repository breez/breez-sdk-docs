
def list_supported_fiat_currencies(sdk_services):
   try:
    # ANCHOR: list-fiat-currencies
    supported_fiat_currencies = sdk_services.list_fiat_currencies()
    # ANCHOR_END: list-fiat-currencies
    return supported_fiat_currencies
   except Exception as error:
    print(error)
    raise

def get_current_rates(sdk_services):
   try:
    # ANCHOR: fetch-fiat-rates
    fiat_rates = sdk_services.fetch_fiat_rates
    # ANCHOR_END: fetch-fiat-rates
    return fiat_rates
   except Exception as error:
    print(error)
    raise