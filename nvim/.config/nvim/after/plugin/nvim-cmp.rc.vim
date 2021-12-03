set completeopt=menu,menuone,noselect " noinsert

lua <<EOF

local cmp = require'cmp'
local lsp_symbols = {
  Text = "  ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = " ﴲ ",
  Variable = "[] ",
  Class = "   ",
  Interface = " ﰮ  ",
  Module = "   ",
  Property = " 襁 ",
  Unit = "   ",
  Value = "   ",
  Enum = " 練 ",
  Keyword = "   ",
  Snippet = "   ",
  Color = "   ",
  File = "   ",
  Reference = "   ",
  Folder = "   ",
  EnumMember = "   ",
  Constant = " ﲀ  ",
  Struct = " ﳤ  ",
  Event = "   ",
  Operator = "   ",
  TypeParameter = "   "
}
cmp.setup(
  {
    snippet = {
      expand = function(args)
	   vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      },
      ["<cr>"] = cmp.mapping.confirm({select = true})
    },
    formatting = {
      format = function(entry, item)
        item.kind = lsp_symbols[item.kind] --item.kind
        -- set a name for each source
        item.menu =
          ({
          spell = "[Spell]",
          buffer = "[Buffer]",
          calc = "[Calc]",
          emoji = "[Emoji]",
          nvim_lsp = "[LSP]",
          path = "[Path]",
          look = "[Look]",
		  ultisnips = "[Snippet]",
          treesitter = "[treesitter]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
          cmp_tabnine = "[Tab9]"
        })[entry.source.name]
        return item
      end
    },
    sources = {
      {name = "nvim_lsp"},
      {name = "path"},
      {name = "ultisnips"},
      {name = "buffer"},
      {name = "nvim_lua"},
      {name = "treesitter"},
      {name = "spell"},
      {name = "calc"},
      {name = "emoji"},
      {name = "look"},
      {name = "latex_symbols"},
      {name = "cmp_tabnine"},
      {name = "neorg"},
    }
  }
)

 -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
vim.cmd(
  [[
augroup NvimCmp
au!
au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]]
)

EOF
