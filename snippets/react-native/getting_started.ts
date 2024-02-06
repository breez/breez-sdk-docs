import {
  type BreezEvent,
  connect,
  defaultConfig,
  EnvironmentType,
  mnemonicToSeed,
  type NodeConfig,
  NodeConfigVariant,
  nodeInfo
} from '@breeztech/react-native-breez-sdk'

const exampleGettingStarted = async () => {
  // ANCHOR: init-sdk
  // SDK events listener
  const onBreezEvent = (e: BreezEvent) => {
    console.log(`Received event ${e.type}`)
  }

  try {
    // Create the default config
    const seed = await mnemonicToSeed('<mnemonics words>')
    const inviteCode = '<invite code>'
    const apiKey = '<api key>'
    const nodeConfig: NodeConfig = {
      type: NodeConfigVariant.GREENLIGHT,
      config: {
        inviteCode
      }
    }

    const config = await defaultConfig(
      EnvironmentType.PRODUCTION,
      apiKey,
      nodeConfig
    )

    // Connect to the Breez SDK make it ready for use
    await connect(config, seed, onBreezEvent)
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: init-sdk
}

const exampleFetchNodeInfo = async () => {
  // ANCHOR: fetch-balance
  try {
    const nodeState = await nodeInfo()
    const balanceLn = nodeState.channelsBalanceMsat
    const balanceOnchain = nodeState.onchainBalanceMsat
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: fetch-balance
}
