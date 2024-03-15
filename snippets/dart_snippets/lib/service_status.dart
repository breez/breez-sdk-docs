import 'package:breez_sdk/sdk.dart';

Future<void> healthCheckStatus({required String apiKey}) async {
  // ANCHOR: health-check-status
  ServiceHealthCheckResponse healthCheck = await BreezSDK.serviceHealthCheck(apiKey: apiKey);
  print("Current service status is: ${healthCheck.status}");
  // ANCHOR_END: health-check-status
}

Future<void> reportPaymentFailure({required String paymentHash}) async {
  // ANCHOR: report-payment-failure
  ReportIssueRequest req = ReportIssueRequest.paymentFailure(
    data: ReportPaymentFailureDetails(
      paymentHash: paymentHash,
    ),
  );
  await BreezSDK.reportIssue(req: req);
  // ANCHOR_END: report-payment-failure
}
