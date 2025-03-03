import logging
import breez_sdk


def sign_message(sdk_services):
    # ANCHOR: sign-message
    message = "<message to sign>"
    try:
        sign_message_request = breez_sdk.SignMessageRequest(message)
        sign_message_response = sdk_services.sign_message(sign_message_request)

        # Get the node info for your pubkey
        info = sdk_services.node_info()

        signature = sign_message_response.signature
        pubkey = info.id

        logging.debug(f"Pubkey: {pubkey}")
        logging.debug(f"Signature: {signature}")
    except Exception as error:
        logging.error(error)
        raise
    # ANCHOR_END: sign-message

def check_message(sdk_services):
    # ANCHOR: check-message
    message = "<message>"
    pubkey = "<pubkey of signer>"
    signature = "<message signature>"
    try:
        check_message_request = breez_sdk.CheckMessageRequest(message, pubkey, signature)
        check_message_response = sdk_services.check_message(check_message_request)

        is_valid = check_message_response.is_valid

        logging.debug(f"Signature valid: {is_valid}")
    except Exception as error:
        logging.error(error)
        raise
    # ANCHOR_END: check-message
