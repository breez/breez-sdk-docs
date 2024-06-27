import {
  type GreenlightCredentials,
  type NodeConfig,
  NodeConfigVariant
} from '@breeztech/react-native-breez-sdk'

const productionNodeConfig = (): NodeConfig => {
  // ANCHOR: moving-to-production
  // Read in your Greenlight credentials from the file
  // system, environment variable or build config
  const developerKey: number[] = []
  const developerCert: number[] = []
  const greenlightCredentials: GreenlightCredentials = {
    developerKey,
    developerCert
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
