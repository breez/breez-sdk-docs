import 'package:dart_snippets/sdk_instance.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<void> healthCheckStatus() async {
  // ANCHOR: health-check-status
  ServiceHealthCheckResponse healthCheck = await breezSDK.serviceHealthCheck(apiKey: "<api key>");
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
  await breezSDK.reportIssue(req: req);
  // ANCHOR_END: report-payment-failure
}
