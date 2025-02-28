import 'package:dart_snippets/sdk_instance.dart';
import 'package:breez_sdk/bridge_generated.dart';

Future<SignMessageResponse> signMessage() async {
  // ANCHOR: sign-message
  SignMessageResponse signMessageResponse = await breezSDK.signMessage(
    req: SignMessageRequest(message: "<message to sign>"),
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
  CheckMessageResponse checkMessageResponse = await breezSDK.checkMessage(
    req: CheckMessageRequest(
      message: "<message>",
      pubkey: "<pubkey of signer>",
      signature: "<message signature>"
    ),
  );

  bool isValid = checkMessageResponse.isValid;

  print("Signature valid: $isValid");
  // ANCHOR_END: check-message
  return checkMessageResponse;
}
