local M = {}

M.setup = function(on_attach, capabilities)
  require'lspconfig'.clangd.setup{
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
end

return M
