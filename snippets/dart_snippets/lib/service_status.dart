import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<void> healthCheckStatus() async {
  // ANCHOR: health-check-status
  ServiceHealthCheckResponse healthCheck = await BreezSDK().serviceHealthCheck();
  print("Current service status is: ${healthCheck.status}");
  // ANCHOR_END: health-check-status
}

Future<void> reportPaymentFailure() async {
  // ANCHOR: report-payment-failure
  String paymentHash = "...";
  await BreezSDK().reportIssue(ReportIssueRequest.paymentFailure(paymentHash: paymentHash));
  // ANCHOR_END: report-payment-failure
}
