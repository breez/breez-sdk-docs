import { connectLsp, listLsps, lspId, lspInfo } from '@breeztech/react-native-breez-sdk'

const exampleAutoConnect = async () => {
  // ANCHOR: get-lsp-info
  const id = await lspId()
  const info = await lspInfo()
  // ANCHOR_END: get-lsp-info
}

const exampleListLsps = async () => {
  // ANCHOR: list-lsps
  const availableLsps = await listLsps()
  // ANCHOR_END: list-lsps
}

const exampleManualConnect = async () => {
  // ANCHOR: connect-lsp
  const id = 'your selected lsp id'
  await connectLsp(id)
  // ANCHOR_END: connect-lsp
}
