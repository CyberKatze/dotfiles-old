local u = require("utils")

local lsp = vim.lsp

local BORDER_OPTS = { border = "single", focusable = false, scope = "line" }
-- config the diagnostic use false to remove altogether
vim.diagnostic.config({ virtual_text = true, float = BORDER_OPTS })

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, BORDER_OPTS)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, BORDER_OPTS)

global.lsp = {
    border_opts = BORDER_OPTS,
}

local on_attach = function(client, bufnr)
    -- commands
    u.lua_command("LspFormatting", "vim.lsp.buf.formatting()")
    u.lua_command("LspHover", "vim.lsp.buf.hover()")
    u.lua_command("LspRename", "vim.lsp.buf.rename()")
    u.lua_command("LspDiagPrev", "vim.diagnostic.goto_prev()")
    u.lua_command("LspDiagNext", "vim.diagnostic.goto_next()")
    u.lua_command("LspDiagLine", "vim.diagnostic.open_float(nil, global.lsp.BORDER_OPTS)")
    u.lua_command("LspDiagQuickfix", "vim.diagnostic.setqflist()")
    u.lua_command("LspSignatureHelp", "vim.lsp.buf.signature_help()")
    u.lua_command("LspTypeDef", "vim.lsp.buf.type_definition()")
    u.lua_command("LspDef", "vim.lsp.buf.definition()")
    u.lua_command("LspDec", "vim.lsp.buf.declaration()")
    u.lua_command("LspImp", "vim.lsp.buf.implementation()")
    u.lua_command("LspRef", "vim.lsp.buf.references()")
    u.buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    u.buf_map(bufnr, "n", "gk", ":LspHover<CR>")
    u.buf_map(bufnr, "n", "gi", ":LspImp<CR>")
    u.buf_map(bufnr, "n", "gr", ":LspRef<CR>")
    u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    u.buf_map(bufnr, "n", "gD", ":LspDec<CR>")

    u.buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    u.buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    u.buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    u.buf_map(bufnr, "n", "<Leader>q", ":LspDiagQuickfix<CR>")
    u.buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

    if client.resolved_capabilities.document_formatting then
        u.buf_map(bufnr, "n", "<Leader>ff", ":LspFormatting<CR>")
        -- too slow
        -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
    end

    require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- I don't know how add cmp capabilities
--capabilities = require("cmp").update_capabilities(capabilities)

for _, server in ipairs({
   "null-ls",
   "clangd",
   "eslint",
   "tsserver",
   "cmake",
   "sumneko_lua",
   "gopls",
}) do
   require("lsp." .. server).setup(on_attach, capabilities)
end


-- suppress lspconfig messages
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("%[lspconfig%]") then
        return
    end

    notify(msg, ...)
end
