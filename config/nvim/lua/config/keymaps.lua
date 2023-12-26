local keymap = vim.keymap.set
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

-- Move to window
keymap('n', 'sh', '<C-w>h', opts)
keymap('n', 'sl', '<C-w>l', opts)
keymap('n', 'sj', '<C-w>j', opts)
keymap('n', 'sk', '<C-w>k', opts)

-- Horizontal split window
keymap('n', 'ss', ':split<CR> :wincmd j<CR>', opts)

-- Vertical split window
keymap('n', 'sv', ':vsplit<CR> :wincmd l<CR>', opts)

-- Vertical split terminal
-- keymap('n', 'st', ':vsplit<CR><C-w>w', opts)

-- Format code
keymap('n', '<leader>ff', ':lua vim.lsp.buf.format({ async = true })<CR>', opts, { desc = 'Format document'})

-- Recharge file
keymap('n', '<leader>rl', ':luafi %<CR>', opts, { desc = 'Realod file config' })

-- Keymaps LSP
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts, { desc = 'Go to definition'})
keymap('n', 'rn', ':lua vim.lsp.buf.rename()<CR>', opts, { desc = 'Rename variables'})
keymap('n', 'H', ':lua vim.lsp.buf.hover()<CR>', opts)
keymap('n', 'K', ':lua vim.lsp.buf.signature_help()<CR>', opts)
keymap('n', '<C-j>', ':lua vim.diagnostic.goto_next()<CR>', opts)
keymap('n', '<C-k>', ':lua vim.diagnostic.goto_prev()<CR>', opts)
keymap('n', '<leader>ge', ':lua vim.diagnostic.open_float()<CR>', opts)
-- keymap('n', '<leader>gl', ':lua vim.diagnostic.setloclist()<CR>', opts)

-- Move next buffer
keymap('n', '<Tab>', ':bnext<CR>', opts, { desc = 'Move to next buffer' })
keymap('n', '<S-Tab>', ':bprevious<CR>', opts, { desc = 'Move to previous buffer' })
keymap('n', '<C-w>', ':bdelete<CR>', opts)

-- Move line up and down
keymap('n', '<A-j>', '<cmd>m .+1<cr>==', opts, { desc = 'Move down' })
keymap('n', '<A-k>', '<cmd>m .-2<cr>==', opts, { desc = 'Move up' })
keymap('v', '<A-j>', "<cmd>m '>+1<cr>gv=gv", opts, { desc = 'Move down' })
keymap('v', '<A-k>', "<cmd>m '<-2<cr>gv=gv", opts, { desc = 'Move up' })

-- Open lazygit
keymap('n', '<leader>lg', ':LazyGit<CR>', opts, { desc = 'Open lazygit' })

-- Neotree
keymap('n', 'nf', ':Neotree toggle<CR>', opts, { desc = 'Toggle neotree'})

-- Compile and run rust projects
keymap('n', '<leader>rmk', '[[:w<CR>:term cargo run<CR>]]', opts, { desc = 'Compile rust projects' })
keymap('n', '<leader>cmk', '[[:w<CR>:term gcc main.c -o main && ./main<CR>]]', opts, { desc = 'Compile rust projects' })
