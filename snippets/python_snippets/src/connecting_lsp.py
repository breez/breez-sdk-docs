
def get_lsp_info(sdk_services):
    try: 
        # ANCHOR: get-lsp-info
        lsp_id = sdk_services.lsp_id()
        lsp_info = sdk_services.lsp_info()
        # ANCHOR_END: get-lsp-info
        return lsp_info
    except Exception as error: 
        print(error)
        raise

def connect_lsp(sdk_services,lsp_id):
    try:
        # ANCHOR: connect-lsp
        sdk_services.connect_lsp(lsp_id)
        # ANCHOR_END: connect-lsp
    except Exception as error:
        print(error)
        raise