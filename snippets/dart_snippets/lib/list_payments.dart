import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<List<Payment>> listPayments() async {
  // ANCHOR: list-payments
  ListPaymentsRequest req = ListPaymentsRequest(filter: PaymentTypeFilter.All);
  List<Payment> paymentsList = await BreezSDK().listPayments(req: req);
  print(paymentsList);
  // ANCHOR_END: list-payments
  return paymentsList;
}

Future<List<Payment>> listPaymentsFiltered({
  DateTime? startDate,
  DateTime? endDate,
  bool? includeFailures,
  int? offset,
  int? limit,
}) async {
  // ANCHOR: list-payments-filtered
  ListPaymentsRequest req = ListPaymentsRequest(
    filter: PaymentTypeFilter.Sent,
    fromTimestamp: startDate?.millisecondsSinceEpoch,
    toTimestamp: endDate?.millisecondsSinceEpoch,
    includeFailures: includeFailures,
    offset: offset,
    limit: limit,
  );
  List<Payment> paymentsList = await BreezSDK().listPayments(req: req);
  print(paymentsList);
  // ANCHOR_END: list-payments-filtered
  return paymentsList;
}
