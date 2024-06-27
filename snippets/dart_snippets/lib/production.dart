import 'dart:typed_data';

import 'package:breez_sdk/bridge_generated.dart';

NodeConfig productionNodeConfig() {
  // ANCHOR: moving-to-production
  // Read in your Greenlight credentials from the file 
  // system, environment variable or build config
  Uint8List developerKey = Uint8List(0);
  Uint8List developerCert = Uint8List(0);
  GreenlightCredentials greenlightCredentials = GreenlightCredentials(
    developerKey: developerKey, 
    developerCert: developerCert,
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
