package example

import (
	"log"
)

func GetLspInfo() error {
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
	return nil
}

func ListLsps() error {
	// ANCHOR: list-lsps
	lspList, err := sdk.ListLsps()
	if err != nil {
		return err
	}
	log.Printf("%#v", lspList)
	// ANCHOR_END: list-lsps
	return nil
}

func ConnectLsp() error {
	// ANCHOR: connect-lsp
	lspId := "your selected lsp id"

	err := sdk.ConnectLsp(lspId)
	if err != nil {
		return err
	}
	// ANCHOR_END: connect-lsp
	return nil
}
