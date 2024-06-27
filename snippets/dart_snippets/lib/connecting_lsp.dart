import 'package:dart_snippets/sdk_instance.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<void> getLspInfo() async {
  // ANCHOR: get-lsp-info
  String? lspId = await breezSDK.lspId();
  LspInformation? lspInfo = await breezSDK.lspInfo();
  print(lspId);
  print(lspInfo);
  // ANCHOR_END: get-lsp-info
}

Future<List<LspInformation>> listLsps() async {
  // ANCHOR: list-lsps
  List<LspInformation> availableLsps = await breezSDK.listLsps();
  // ANCHOR_END: list-lsps
  return availableLsps;
}

Future<void> connectLsp(String lspId) async {
  // ANCHOR: connect-lsp
  await breezSDK.connectLSP(lspId);
  // ANCHOR_END: connect-lsp
}