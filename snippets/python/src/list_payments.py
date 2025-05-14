import breez_sdk
import logging

sdk_services = breez_sdk.BlockingBreezServices


def list_payments():
    try:
        # ANCHOR: list-payments
        req = breez_sdk.ListPaymentsRequest(filters=breez_sdk.PaymentTypeFilter.All)
        sdk_services.list_payments(req=req)
        # ANCHOR_END: list-payments
    except Exception as error:
        logging.error(error)
        raise

def list_payments_filtered():
    try:
        # ANCHOR: list-payments-filtered
        req = breez_sdk.ListPaymentsRequest(
            filters=breez_sdk.PaymentTypeFilter.Sent, 
            from_timestamp=1696880000, 
            include_failures=True)
        sdk_services.list_payments(req=req)
        # ANCHOR_END: list-payments-filtered
    except Exception as error:
        logging.error(error)
        raise