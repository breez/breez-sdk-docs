import {
  checkMessage,
  nodeInfo,
  signMessage
} from '@breeztech/react-native-breez-sdk'

const exampleSignMessage = async () => {
  // ANCHOR: sign-message
  const signMessageResponse = await signMessage({
    message: '<message to sign>'
  })

  // Get the node info for your pubkey
  const info = await nodeInfo()

  const signature = signMessageResponse.signature
  const pubkey = info.id

  console.log(`Pubkey: ${pubkey}`)
  console.log(`Signature: ${signature}`)
  // ANCHOR_END: sign-message
}

const exampleCheckMessage = async () => {
  // ANCHOR: check-message
  const checkMessageResponse = await checkMessage({
    message: '<message>',
    pubkey: '<pubkey of signer>',
    signature: '<message signature>'
  })
  const isValid = checkMessageResponse.isValid

  console.log(`Signature valid: ${isValid}`)
  // ANCHOR_END: check-message
}
