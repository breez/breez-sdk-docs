use std::sync::Arc;

use anyhow::Result;
use breez_sdk_core::*;
use log::info;

async fn health_check_status(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: health-check-status
    let api_key = "<api key>".to_string();

    let health_check = BreezServices::service_health_check(api_key).await?;
    info!("Current service status is: {:?}", health_check.status);
    // ANCHOR_END: health-check-status

    Ok(())
}

async fn report_payment_failure(sdk: Arc<BreezServices>) -> Result<()> {
    // ANCHOR: report-payment-failure
    let payment_hash = String::from("...");

    sdk.report_issue(ReportIssueRequest::PaymentFailure {
        data: ReportPaymentFailureDetails {
            payment_hash,
            comment: None,
        },
    })
    .await?;
    // ANCHOR_END: report-payment-failure

    Ok(())
}
