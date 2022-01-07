local null_ls = require("null-ls")
local b = null_ls.builtins

local filetype_t = {"javascript", "javascriptreact",
        "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx"}

local sources = {
    b.formatting.prettier.with{
      filetypes = filetype_t,
      preferred_formatting_clients = "node_modules/.bin"
    },
    b.diagnostics.eslint.with{
      filetypes = filetype_t,
      preferred_formatting_clients = "node_modules/.bin"
    },
    b.code_actions.eslint_d.with{
      filetypes = filetype_t,
      preferred_formatting_clients = "node_modules/.bin"
    },
}

local M = {}
M.setup = function(on_attach)
    null_ls.setup({
        -- debug = true,
        sources = sources,
        on_attach = on_attach,
    })
end

return M

