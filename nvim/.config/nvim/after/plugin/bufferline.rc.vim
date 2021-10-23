lua << EOF
require("bufferline").setup{
	options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict)
			local icon = level:match("error") and " " or " "
			  return " " .. icon .. count
			end,
			separator_style = "thin" 
		}
}
EOF

