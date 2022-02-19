local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Use enter to create new lines without entering insert mode
keymap("n", "<CR>", "o<Esc>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate properly when lines are wrapped
keymap("n", "k", "gk", opts)
keymap("n", "j", "gj", opts)

-- Map Ctrl+S to save in any mode
keymap("n", "<C-S>", ":update<CR>", opts)
keymap("v", "<C-S>", "<C-C>:update<CR>", opts)
keymap("i", "<C-S>", "<C-O>:update<CR>", opts)
keymap("n","<leader>w", "<cmd>w!<CR>", opts)

-- Close buffer
keymap("n","<leader>c", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<C-B>", "<C-C>:bdelete<CR>", opts)
keymap("v", "<C-B>", "<C-C>:bdelete<CR>", opts)
keymap("i", "<C-B>", "<C-O>:bdelete<CR>", opts)

-- Exit highlight
keymap("n","<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close window
keymap("n", "<leader>x", ":x<CR>", opts)
keymap("n", "<leader>X", ":q!<CR>", opts)

-- zoom a vim pane, <C-w>= to re-balance
 keymap("n", "<leader>-" ,":wincmd _<CR>:wincmd \\|<CR>", opts)
 keymap("n", "<leader>=", ":wincmd =<CR>", opts)


-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Switch between the last two files
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Open link, or path with graphical app https://github.com/m3dsh
keymap("n","gx", ":!open <cWORD><cr>", opts)

-- Alpha
keymap("n","<leader>a", "<cmd>Alpha<cr>", opts)

-- Telescope
keymap("n","<leader>b",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", opts)
keymap("n","<leader>f",
  "<cmd>lua require('telescope.builtin').find_files("
    .. "vim.tbl_deep_extend('force', require('telescope.themes').get_dropdown{previewer = false},"
    .. "{find_command = {'rg', '--files', '--hidden', '-g', '!.git' }}))<CR>", opts)
keymap("n","<leader>F",
  "<cmd>lua require('telescope.builtin').live_grep("
    .. "vim.tbl_deep_extend('force', require('telescope.themes').get_ivy(),"
    .. "{find_command = {'rg', '--files', '--hidden', '-g', '!.git' }}))<CR>", opts)
keymap("n","<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts)

-- Nvimtree
keymap("n","<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- Move the current buffer with numbers
keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

-- Packer
keymap("n","<leader>pc", "<cmd>PackerCompile<cr>", opts)
keymap("n","<leader>pi", "<cmd>PackerInstall<cr>", opts)
keymap("n","<leader>ps", "<cmd>PackerSync<cr>", opts)
keymap("n","<leader>pS", "<cmd>PackerStatus<cr>", opts)
keymap("n","<leader>pu", "<cmd>PackerUpdate<cr>", opts)

-- Gitsign
keymap("n","<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n","<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", opts)
keymap("n","<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", opts)
keymap("n","<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", opts)
keymap("n","<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", opts)
keymap("n","<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", opts)
keymap("n","<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", opts)
keymap("n","<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", opts)
keymap("n","<leader>gS", "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", opts)
keymap("n","<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",opts)
keymap("n","<leader>gU", "<cmd>lua require 'gitsigns'.reset_buffer_index()<cr>",opts)
keymap("n","<leader>go", "<cmd>Telescope git_status<cr>", opts)
keymap("n","<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
keymap("n","<leader>gc", "<cmd>Telescope git_commits<cr>", opts)
keymap("n","<leader>gD", "<cmd>Gitsigns diffthis HEAD<cr>",opts)

-- LSP
keymap("n","<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>",opts)
keymap("n","<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>",opts)
keymap("n","<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap("n","<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n","<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
keymap("n","<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>",opts)
keymap("n","<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",opts)
keymap("n","<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",opts)
keymap("n","<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
keymap("n","<leader>lq", "<cmd>lua vim.diagnostic.set_loclist()<cr>", opts)
keymap("n","<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n","<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
keymap("n","<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",opts)

-- Telescope More
keymap("n","<leader>sb", "<cmd>Telescope git_branches<cr>", opts)
keymap("n","<leader>sc", "<cmd>Telescope colorscheme<cr>", opts)
keymap("n","<leader>sh", "<cmd>Telescope help_tags<cr>", opts)
keymap("n","<leader>sM", "<cmd>Telescope man_pages<cr>", opts)
keymap("n","<leader>sr", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n","<leader>sR", "<cmd>Telescope registers<cr>", opts)
keymap("n","<leader>sk", "<cmd>Telescope keymaps<cr>", opts)
keymap("n","<leader>sC", "<cmd>Telescope commands<cr>", opts)

-- Float Terminal
keymap("n","<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", opts)
keymap("n","<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", opts)
keymap("n","<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", opts)
keymap("n","<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts)
keymap("n","<leader>tf", "<cmd>ToggleTerm direction=float<cr>", opts)
keymap("n","<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)
keymap("n","<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", opts)
