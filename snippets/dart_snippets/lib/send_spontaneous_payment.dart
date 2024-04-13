import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';
import 'dart:convert';

Future<SendPaymentResponse> sendSpontaneousPayment({
  required String nodeId,
}) async {
  // ANCHOR: send-spontaneous-payment
  String optionalLabel = "<label>";

  SendSpontaneousPaymentRequest req = SendSpontaneousPaymentRequest(
    amountMsat: 3000000,
    nodeId: nodeId,
    label: optionalLabel,
  );
  SendPaymentResponse resp = await BreezSDK().sendSpontaneousPayment(req: req);
  // ANCHOR_END: send-spontaneous-payment
  return resp;
}

Future<SendPaymentResponse> sendSpontaneousPaymentWithTlvs({
  required String nodeId,
}) async {
  // ANCHOR: send-spontaneous-payment-with-tlvs
  List<TlvEntry> optionalExtraTlvs = [
    TlvEntry(
      fieldNumber: 34349334,
      value: utf8.encode("Hello world!"),
    )
  ];
  SendSpontaneousPaymentRequest req = SendSpontaneousPaymentRequest(
    amountMsat: 3000000,
    nodeId: nodeId,
    extraTlvs: optionalExtraTlvs,
  );
  SendPaymentResponse resp = await BreezSDK().sendSpontaneousPayment(req: req);
  // ANCHOR_END: send-spontaneous-payment-with-tlvs
  return resp;
}
