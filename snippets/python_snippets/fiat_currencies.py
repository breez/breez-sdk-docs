import breez_sdk
from breez_sdk import BlockingBreezServices
import logging

sdk_services = BlockingBreezServices

def list_supported_fiat_currencies():
   try:
    # ANCHOR: list-fiat-currencies
    supported_fiat_currencies = sdk_services.list_fiat_currencies()
    # ANCHOR_END: list-fiat-currencies
    return supported_fiat_currencies
   except Exception as error:
    logging.error(error)
    raise

def get_current_rates():
   try:
    # ANCHOR: fetch-fiat-rates
    fiat_rates = sdk_services.fetch_fiat_rates
    # ANCHOR_END: fetch-fiat-rates
    return fiat_rates
   except Exception as error:
    logging.error(error)
    raise