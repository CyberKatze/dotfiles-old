local M = {
    setup = function(on_attach, capabilities)
        require("lspconfig")["eslint"].setup({
            on_attach = function(client, bufnr)
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
            settings = {
                format = {
                    enable = false,
                },
            },
        })
    end,
}

return M
