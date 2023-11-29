import {
  type GreenlightCredentials,
  type NodeConfig,
  NodeConfigVariant
} from '@breeztech/react-native-breez-sdk'

const productionNodeConfig = (): NodeConfig => {
  // ANCHOR: moving-to-production
  // Read your Greenlight credentials from secure storage
  const deviceKey: number[] = []
  const deviceCert: number[] = []
  const greenlightCredentials: GreenlightCredentials = {
    deviceKey,
    deviceCert
  }

  const nodeConfig: NodeConfig = {
    type: NodeConfigVariant.GREENLIGHT,
    config: {
      partnerCredentials: greenlightCredentials
    }
  }
  // ANCHOR_END: moving-to-production
  return nodeConfig
}
