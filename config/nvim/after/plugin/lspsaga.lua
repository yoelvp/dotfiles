local ok, lspsaga = pcall(require, 'lspsaga')
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

if (not ok) then return end

lspsaga.setup({
  symbol_in_winbar = {
    enable = false,
  },
})

-- Keymaps
keymap('n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', 'K', ':Lspsaga hover_doc<CR>', opts)
keymap('n', 'gd', ':Lspsaga lsp_finder<CR>', opts)
keymap('i', '<C-k>', ':Lspsaga signature_help<CR>', opts)
keymap('n', 'gp', ':Lspsaga preview_definition<CR>', opts)
keymap('n', 'gr', ':Lspsaga rename<CR>', opts)
