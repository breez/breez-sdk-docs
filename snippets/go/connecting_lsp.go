package example

import (
	"log"
)

func GetLspInfo() {
	// ANCHOR: get-lsp-info
	if lspId, err := sdk.LspId(); lspId != nil && err == nil {
		log.Printf("%#v", *lspId)
	}

	if lspInfo, err := sdk.LspInfo(); err == nil {
		log.Printf("%#v", lspInfo)
	}
	// ANCHOR_END: get-lsp-info
}

func ListLsps() {
	// ANCHOR: list-lsps
	if err := sdk.ListLsps(); err != nil {
		log.Printf("%#v", err)
	}
	// ANCHOR_END: list-lsps
}

func ConnectLsp() {
	// ANCHOR: connect-lsp
	lspId := "your selected lsp id"

	if err := sdk.ConnectLsp(lspId); err != nil {
		log.Printf("%#v", err)
	}
	// ANCHOR_END: connect-lsp
}
