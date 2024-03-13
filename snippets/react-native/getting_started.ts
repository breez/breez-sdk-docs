import {
  type BreezEvent,
  connect,
  type Config,
  type ConnectRequest,
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
    const connectRequest: ConnectRequest = { config, seed }
    await connect(connectRequest, onBreezEvent)
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: init-sdk
}
const exampleGettingRestoreOnly = async (config: Config, seed: number[]) => {
  const onBreezEvent = (e: BreezEvent) => {
    console.log(`Received event ${e.type}`)
  }
  
  try {
    // ANCHOR: init-sdk-restore-only
    const connectRequest: ConnectRequest = { config, seed, restoreOnly: true }
    await connect(connectRequest, onBreezEvent)
    // ANCHOR_END: init-sdk-restore-only
  } catch (err) {
    console.error(err)
  }
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
