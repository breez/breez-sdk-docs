import 'dart:typed_data';

import 'package:breez_sdk/breez_sdk.dart';
import 'package:breez_sdk/bridge_generated.dart';

NodeConfig productionNodeConfig() {
  // ANCHOR: moving-to-production
  // Read your Greenlight credentials from secure storage
  Uint8List deviceKey = Uint8List(0);
  Uint8List deviceCert = Uint8List(0);
  GreenlightCredentials greenlightCredentials = GreenlightCredentials(deviceKey, deviceCert);

  NodeConfig nodeConfig = NodeConfig.greenlight(
    config: GreenlightNodeConfig(
      partnerCredentials: greenlightCredentials,
      inviteCode: null,
    ),
  );
  // ANCHOR_END: moving-to-production
  return nodeConfig;
}
