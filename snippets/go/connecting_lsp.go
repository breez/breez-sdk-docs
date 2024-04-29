package example

import (
	"log"
)

func GetLspInfo() {
	// ANCHOR: get-lsp-info
	lspId, err := sdk.LspId()
	if err != nil {
		return err
	}
	if lspId != nil {
		log.Printf("%#v", *lspId)
	}

	lspInfo, err := sdk.LspInfo()
	if err != nil {
		return err
	}
	log.Printf("%#v", lspInfo)
	// ANCHOR_END: get-lsp-info
}

func ListLsps() {
	// ANCHOR: list-lsps
	lspList, err := sdk.ListLsps()
	if err != nil {
		return err
	}
	log.Printf("%#v", lspList)
	// ANCHOR_END: list-lsps
}

func ConnectLsp() {
	// ANCHOR: connect-lsp
	lspId := "your selected lsp id"

	_, err := sdk.ConnectLsp(lspId)
	if err != nil {
		return err
	}
	// ANCHOR_END: connect-lsp
}
