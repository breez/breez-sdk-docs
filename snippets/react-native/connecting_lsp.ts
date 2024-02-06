import { connectLsp, listLsps, lspId, lspInfo } from '@breeztech/react-native-breez-sdk'

const exampleAutoConnect = async () => {
  // ANCHOR: get-lsp-info
  try {
    const id = await lspId()
    const info = await lspInfo()
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: get-lsp-info
}

const exampleListLsps = async () => {
  // ANCHOR: list-lsps
  try {
    const availableLsps = await listLsps()
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: list-lsps
}

const exampleManualConnect = async () => {
  // ANCHOR: connect-lsp
  try {
    const id = 'your selected lsp id'
    await connectLsp(id)
  } catch (err) {
    console.error(err)
  }
  // ANCHOR_END: connect-lsp
}
