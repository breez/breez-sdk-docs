import 'dart:typed_data';

import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<void> initializeSDK() async {
  // ANCHOR: init-sdk

  // Initialize SDK logs listener
  BreezSDK().initialize();

  // Create the default config
  Uint8List seed = await BreezSDK().mnemonicToSeed("<mnemonic words>");
  String inviteCode = "<invite code>";
  String apiKey = "<api key>";
  NodeConfig nodeConfig = NodeConfig.greenlight(
    config: GreenlightNodeConfig(
      partnerCredentials: null,
      inviteCode: inviteCode,
    ),
  );
  Config config = await BreezSDK().defaultConfig(
    envType: EnvironmentType.Production,
    apiKey: apiKey,
    nodeConfig: nodeConfig,
  );

  // Customize the config object according to your needs
  config = config.copyWith(workingDir: "path to an existing directory");

  // Connect to the Breez SDK make it ready for use
  ConnectRequest connectRequest = ConnectRequest(config: config, seed: seed);
  return await BreezSDK().connect(req: connectRequest);
  // ANCHOR_END: init-sdk
}

Future<void> connectRestoreOnly(Config config, Uint8List seed) async {
  // ANCHOR: init-sdk-restore-only
  ConnectRequest connectRequest = ConnectRequest(config: config, seed: seed, restoreOnly: true);
  return await BreezSDK().connect(req: connectRequest);
  // ANCHOR_END: init-sdk-restore-only
}

Future<void> fetchBalance(String lspId) async {
  // ANCHOR: fetch-balance
  NodeState? nodeInfo = await BreezSDK().nodeInfo();
  if (nodeInfo != null) {
    int lnBalance = nodeInfo.channelsBalanceMsat;
    int onchainBalance = nodeInfo.onchainBalanceMsat;
    print(lnBalance);
    print(onchainBalance);
  }
  // ANCHOR_END: fetch-balance
}

// ANCHOR: logging
void onLogEntry(log) {
  print("Received log ${log.level}]: ${log.line}");
}

void logging(BreezSDK breezSDK) {
  breezSDK.logStream.listen(onLogEntry);
}
// ANCHOR_END: logging
