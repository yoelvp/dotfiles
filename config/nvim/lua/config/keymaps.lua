local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- disable macros
keymap('n', 'q', '<Nop>', {})

-- Move with <C-{h,j,k,l}>
keymap('i', '<C-h>', '<Left>', {})
keymap('i', '<C-j>', '<Down>', {})
keymap('i', '<C-k>', '<Up>', {})
keymap('i', '<C-l>', '<Right>', {})

-- Enable wrap mode
keymap('n', '<A-z>', ':set wrap!<CR>', { silent = true })

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Horizontal split window
keymap('n', 'ss', ':split<CR><C-w>w', opts)

-- Vertical split window
keymap('n', 'sv', ':vsplit<CR><C-w>w', opts)

-- Format code
keymap('n', '<leader>ff', ':lua vim.lsp.buf.format({ async = true })<CR>', opts)

-- Keymaps LSP
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', 'gr', ':lua vim.lsp.buf.rename()<CR>', opts)
keymap('n', 'K', ':lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '<leader>ge', ':lua vim.diagnostic.open_float()<CR>', opts)
keymap('n', '<leader>gl', ':lua vim.diagnostic.setloclist()<CR>', opts)

-- Move window
keymap('n', 'sh', '<C-w>h', opts)
keymap('n', 'sl', '<C-w>l', opts)
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sk', '<C-w>k', opts)

-- Move next buffer
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)
keymap('n', '<C-w>', ':bdelete<CR>', opts)

-- Move line up and down
keymap('n', '<A-j>', '<cmd>m .+1<cr>==', { noremap = true, silent = true, desc = 'Move down' })
keymap('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
keymap('v', '<A-j>', "<cmd>m '>+1<cr>gv=gv", { desc = 'Move down' })
keymap('v', '<A-k>', "<cmd>m '<-2<cr>gv=gv", { desc = 'Move up' })

-- Open lazygit
keymap('n', '<leader>lg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Neotree
keymap('n', 'nf', ':Neotree toggle<CR>', opts)
