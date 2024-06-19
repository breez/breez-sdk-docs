import 'dart:typed_data';

import 'package:breez_sdk/bridge_generated.dart';

NodeConfig productionNodeConfig() {
  // ANCHOR: moving-to-production
  // Read in your Greenlight credentials from the file 
  // system, environment variable or build config
  Uint8List deviceKey = Uint8List(0);
  Uint8List deviceCert = Uint8List(0);
  GreenlightCredentials greenlightCredentials = GreenlightCredentials(
    deviceKey: deviceKey, 
    deviceCert: deviceCert,
  );

  NodeConfig nodeConfig = NodeConfig.greenlight(
    config: GreenlightNodeConfig(
      partnerCredentials: greenlightCredentials,
      inviteCode: null,
    ),
  );
  // ANCHOR_END: moving-to-production
  return nodeConfig;
}
