import breez_sdk
import logging

sdk_services = breez_sdk.BlockingBreezServices


def list_payments():
    try:
        # ANCHOR: list-payments
        sdk_services.list_payments(breez_sdk.ListPaymentsRequest(breez_sdk.PaymentTypeFilter.All))
        # ANCHOR_END: list-payments
    except Exception as error:
        logging.error(error)
        raise

def list_payments_filtered():
    try:
        # ANCHOR: list-payments-filtered
        req = breez_sdk.ListPaymentsRequest(
            breez_sdk.PaymentTypeFilter.Sent, 
            from_timestamp = 1696880000, 
            include_failures = True)
        sdk_services.list_payments(req)
        # ANCHOR_END: list-payments-filtered
    except Exception as error:
        logging.error(error)
        raise