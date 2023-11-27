import breez_sdk

def health_check_status(sdk_services):
    try: 
        # ANCHOR: health-check-status
        health_check = sdk_services.service_health_check()
        print("Current service status is: ", health_check.status)
        # ANCHOR_END: health-check-status
    except Exception as error: 
        print(error)
        raise

def report_payment_failure(sdk_services):
    try:
        # ANCHOR: report-payment-failure
        payment_hash = "..."
        sdk_services.report_issue(
            breez_sdk.ReportIssueRequest.PAYMENT_FAILURE(
                breez_sdk.ReportPaymentFailureDetails(payment_hash)))
        # ANCHOR_END: report-payment-failure
    except Exception as error:
        print(error)
        raise
