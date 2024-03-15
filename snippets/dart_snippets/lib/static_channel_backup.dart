import 'package:breez_sdk/sdk.dart';

Future<StaticBackupResponse> retrieveBackupFiles({required String workingDir}) async {
  // ANCHOR: static-channel-backup
  StaticBackupRequest req = StaticBackupRequest(workingDir: workingDir);
  StaticBackupResponse resp = await BreezSDK.staticBackup(req: req);
  // ANCHOR_END: static-channel-backup
  return resp;
}
