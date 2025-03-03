import 'package:dart_snippets/sdk_instance.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<SignMessageResponse> signMessage() async {
  // ANCHOR: sign-message
  SignMessageRequest signMessageRequest = SignMessageRequest(
    message: "<message to sign>",
  );
  SignMessageResponse signMessageResponse = await breezSDK.signMessage(
    req: signMessageRequest,
  );

  // Get the node info for your pubkey
  NodeState? info = await breezSDK.nodeInfo();

  String signature = signMessageResponse.signature;
  String? pubkey = info?.id;

  print("Pubkey: $pubkey");
  print("Signature: $signature");
  // ANCHOR_END: sign-message
  return signMessageResponse;
}

Future<CheckMessageResponse> checkMessage() async {
  // ANCHOR: check-message
  CheckMessageRequest checkMessageRequest = CheckMessageRequest(
    message: "<message>",
    pubkey: "<pubkey of signer>",
    signature: "<message signature>",
  );
  CheckMessageResponse checkMessageResponse = await breezSDK.checkMessage(
    req: checkMessageRequest,
  );

  bool isValid = checkMessageResponse.isValid;

  print("Signature valid: $isValid");
  // ANCHOR_END: check-message
  return checkMessageResponse;
}
